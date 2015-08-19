package com.huixinpn.dionysus.controller.psychtest;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.psychtest.dto.PsychTestResultData;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.repository.psychtest.PsychTestRepository;
import com.huixinpn.dionysus.repository.psychtest.PsychTestResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;

@RestController
@RequestMapping(value = "/controllers")
public class PsychTestResultsController {

  @Autowired
  private PsychTestResultRepository resultsRepository;
  
  @Autowired
  private PsychTestRepository testRepository;
  
  @RequestMapping(value = "/psychtest/{id}/submit", method = RequestMethod.POST)
  public ResponseEntity<String> submitTestResult(@PathVariable Long id, @RequestBody PsychTestResult model) {
    PsychTest test = testRepository.findOne(id);
    if (test == null)
      throw new EntityNotFoundException("Invalid psychtest");
    PsychTestResult result = resultsRepository.findOne(id);
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
    }
  }

    @RequestMapping(value="/psychtestresults", method = RequestMethod.GET)
    public EntityPageData<PsychTestResultData> getResults(@RequestParam(value="page", required = false) Integer page,
                                                          @RequestParam(value="size", required = false) Integer size){
        int pageNumber = (page == null ? 0 : page);
        int pageSize = (size == null ? 20 : size);

        Pageable pageable = new PageRequest(pageNumber, pageSize);
        Page<PsychTestResult> result = resultsRepository.findAllResults(pageable);

        return new EntityPageData<>(result, PsychTestResultData.class);
    }

    @RequestMapping(value="/psychtestresults/{id}", method = RequestMethod.GET)
    public
    @ResponseBody
    PsychTestResultData getResult(@PathVariable Long id){
        PsychTestResult psychTestResult = resultsRepository.findOne(id);
        return new PsychTestResultData(psychTestResult);
    }
}
