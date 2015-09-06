package com.huixinpn.dionysus.controller.psychtest;

import com.huixinpn.dionysus.domain.psychtest.*;
import com.huixinpn.dionysus.domain.psychtest.dto.PsychTestResultData;
import com.huixinpn.dionysus.domain.psychtest.eval.PsychTestEvaluationFactory;
import com.huixinpn.dionysus.domain.psychtest.eval.PsychTestEvaluationStrategy;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.repository.psychtest.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/controllers")
public class PsychTestResultsController {

    @Autowired
    private PsychTestResultRepository resultsRepository;

    @Autowired
    private PsychTestRepository testRepository;

    @Autowired
    private PsychTestEvaluationFactory factory;

    @Autowired
    private PsychTestAnswerRepository answerRepository;

    @Autowired
    private PsychTestQuestionRepository questionRepository;

    @Autowired
    private PsychTestQuestionOptionRepository optionRepository;

    @RequestMapping(value = "/psychtest/{id}/submit", method = RequestMethod.POST)
    public ResponseEntity<String> submitTestResult(@PathVariable Long id, @RequestBody String dataString) {
        PsychTest test = testRepository.findOne(id);
        if (test == null)
            throw new EntityNotFoundException("Invalid psychtest");

        try{
            JSONObject resultObject = new JSONObject(dataString);
            JSONArray answers = resultObject.getJSONArray("answers");
            PsychTestResult result;
            //decide update or create
            if(resultObject.has("id")) {
                result = resultsRepository.findOne(resultObject.getLong("id"));
                if(result == null){
                    result = new PsychTestResult();
                    result.setState(PsychTestResult.PsychTestState.IN_PROGRESS);
                    result.setTest(test);
                    resultsRepository.save(result);
                }
                else if(!result.canUpdate()){
                    return new ResponseEntity<>(HttpStatus.CONFLICT);
                }
                saveResult(result, answers);
            }
            else{
                result = new PsychTestResult();
                result.setState(PsychTestResult.PsychTestState.IN_PROGRESS);
                result.setTest(test);
                resultsRepository.save(result);

                saveResult(result, answers);
            }

            return new ResponseEntity<>(result.getId().toString(), HttpStatus.OK);

        }catch (JSONException e){
            return new ResponseEntity<>("JSON Syntax Issue", HttpStatus.BAD_REQUEST);
        }

        /*PsychTestResult result = resultsRepository.findOne(id);
        if (result == null) {
            result = new PsychTestResult();
//      resultsRepository.save(result);
            return new ResponseEntity<>(HttpStatus.CREATED);
        } else {
            if (!result.canUpdate()) {
                return new ResponseEntity<>(HttpStatus.CONFLICT);
            } else {
//        resultsRepository.save(result);
                return new ResponseEntity<>(HttpStatus.OK);
            }
        }*/

    }


    private void saveResult(PsychTestResult psychTestResult, JSONArray answers) throws JSONException{

        PsychTestAnswer psychTestAnswer;
        PsychTestQuestion.PsychTestQuestionType type = null;

        //iterate answers array
        for (Integer i = 0; i < answers.length(); i++){

            JSONObject answer = answers.getJSONObject(i);

            if(answer.has("id")){
                psychTestAnswer = answerRepository.findOne(answer.getLong("id"));
                if (psychTestAnswer == null){
                    psychTestAnswer = new PsychTestAnswer();
                    psychTestAnswer.setResult(psychTestResult);
                    psychTestAnswer.setQuestion(questionRepository.findOne(answer.getLong("qid")));
                }
            }
            else {
                psychTestAnswer = new PsychTestAnswer();
                psychTestAnswer.setResult(psychTestResult);
                psychTestAnswer.setQuestion(questionRepository.findOne(answer.getLong("qid")));
            }

            type = psychTestAnswer.getType();

            switch(type) {
                case SINGLE_CHOICE:
                    psychTestAnswer.setOption(optionRepository.findOne(answer.getLong("value")));
                    break;
                case YES_NO:
                    psychTestAnswer.setYesno(answer.getBoolean("value"));
                    break;
                case GAPFILL:
                    psychTestAnswer.setAnswer(answer.getString("value"));
                default:
                    break;
            }

            answerRepository.save(psychTestAnswer);
        }
    }

    @RequestMapping(value = "/psychtest/{id}", method = RequestMethod.GET)
    public Map<String, String> getTestDetail(@PathVariable Long id){
        PsychTest test = testRepository.findOne(id);
        Map<String, String> detail = new HashMap<>();
        detail.put("id", test.getId().toString());
        detail.put("title", test.getTitle());
        detail.put("description", test.getDescription());
        detail.put("cost", test.getCost());
        detail.put("object", test.getObject());
        detail.put("duration", test.getDuration());
        detail.put("cover", test.getCover());
        detail.put("comment", test.getComment());

        return detail;
    }


    @RequestMapping(value = "/psychtestresults", method = RequestMethod.GET)
    public EntityPageData<PsychTestResultData> getResults(@RequestParam(value = "page", required = false) Integer page,
                                                          @RequestParam(value = "size", required = false) Integer size) {
        int pageNumber = (page == null ? 0 : page);
        int pageSize = (size == null ? 100 : size);

        Pageable pageable = new PageRequest(pageNumber, pageSize);
        Page<PsychTestResult> result = resultsRepository.findAllResults(pageable);

        return new EntityPageData<>(result, PsychTestResultData.class);
    }

    @RequestMapping(value = "/psychtestresults/{id}", method = RequestMethod.GET)
    public
    @ResponseBody
    PsychTestResultData getResult(@PathVariable Long id) {
        PsychTestResult psychTestResult = resultsRepository.findOne(id);
        return new PsychTestResultData(psychTestResult);
    }

    @RequestMapping(value = "/psychtestresults/calcu/{id}", method = RequestMethod.GET)
    public Map<String, Integer> getScore(@PathVariable Long id) {
        PsychTestResult result = resultsRepository.findOne(id);
        PsychTestEvaluationStrategy strategy = factory.create(result.getTest().getType());
        Object obj = strategy.evaluate(result);
        return (Map<String, Integer>) obj;

    }
}
