package com.huixinpn.dionysus.controller.question;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.controller.util.Utils;
import com.huixinpn.dionysus.domain.question.Answer;
import com.huixinpn.dionysus.domain.question.QTag;
import com.huixinpn.dionysus.domain.question.Question;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityCollectionData;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.question.AnswerData;
import com.huixinpn.dionysus.dto.question.QTagData;
import com.huixinpn.dionysus.dto.question.QuestionData;
import com.huixinpn.dionysus.repository.question.AnswerRepository;
import com.huixinpn.dionysus.repository.question.QTagRepository;
import com.huixinpn.dionysus.repository.question.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

@RestController
@RequestMapping(value = "/controllers/questions")
public class QuestionController {

  @Autowired
  QuestionRepository questionRepository;

  @Autowired
  AnswerRepository answerRepository;

  @Autowired
  QTagRepository qTagRepository;

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public EntityPageData<QuestionData> getAllQuestions(@RequestParam(value = "page", required = false) Integer page,
                                                      @RequestParam(value = "size", required = false) Integer size) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Question> questions = questionRepository.findAll(paging);
    return new EntityPageData<>(questions, QuestionData.class);
  }

  @RequestMapping(value = "/me", method = RequestMethod.GET)
  public EntityPageData<QuestionData> myQuestions(@RequestParam(value = "page", required = false) Integer page,
                                                  @RequestParam(value = "size", required = false) Integer size) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    User login = (User) authentication.getPrincipal();
    Page<Question> questions = questionRepository.findByAuthor(login, paging);
    return new EntityPageData<>(questions, QuestionData.class);
  }

  @RequestMapping(value = "/bytag/{id}", method = RequestMethod.GET)
  public EntityPageData<QuestionData> findQuestionsByTag(@PathVariable Long id, @RequestParam(value = "page", required = false) Integer page,
                                                         @RequestParam(value = "size", required = false) Integer size) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Question> questions = questionRepository.findByTag(new QTag(id), paging);
    return new EntityPageData<>(questions, QuestionData.class);
  }

  @RequestMapping(value = "/byauthor/{id}", method = RequestMethod.GET)
  public EntityPageData<QuestionData> findQuestionsByAuthor(@PathVariable Long id, @RequestParam(value = "page", required = false) Integer page,
                                                            @RequestParam(value = "size", required = false) Integer size) {
    PageRequest paging = PagingHelper.getPageRequest(page, size);
    Page<Question> questions = questionRepository.findByAuthor(new User(id), paging);
    return new EntityPageData<>(questions, QuestionData.class);
  }

  @RequestMapping(value = "/latest", method = RequestMethod.GET)
  public Collection<QuestionData> getLatestQuestions(@RequestParam(value = "N") Integer n) {
    PageRequest page = PagingHelper.getPageRequest(0, n);
    Page<Question> latest = questionRepository.findLatestQueations(page);
    return new EntityPageData<>(latest, QuestionData.class).getContent();
  }

  @RequestMapping(value = "/popular", method = RequestMethod.GET)
  public Collection<QuestionData> getPopularQuestions(@RequestParam(value = "N") Integer n) {
    PageRequest page = PagingHelper.getPageRequest(0, n);
    Page<Question> popular = questionRepository.findPopularQueations(page);
    return new EntityPageData<>(popular, QuestionData.class).getContent();
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.GET)
  public QuestionData getQuestion(@PathVariable Long id) {
    Question question = questionRepository.findOne(id);
    return new QuestionData(question);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
  public ResponseEntity<String> updateQuestion(@PathVariable Long id, @RequestBody QuestionData data) {
    Question question = questionRepository.findOne(id);
    data.update(question);
    questionRepository.save(question);
    return new ResponseEntity(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
  public ResponseEntity<String> deleteQuestion(@PathVariable Long id) {
    questionRepository.delete(id);
    return new ResponseEntity(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/{id}/answers", method = RequestMethod.GET)
  public Collection<AnswerData> getAnswers(@PathVariable Long id) {
    Question question = questionRepository.findOne(id);
    return new EntityCollectionData<>(question.getAnswers(), AnswerData.class).toDTOCollection();
  }

  @RequestMapping(value = "/{id}/answers", method = RequestMethod.POST)
  public ResponseEntity<String> addAnswer(@PathVariable Long id, @RequestBody AnswerData data) {
    Answer answer = new Answer();
    answer.setQuestion(new Question(id));
    data.update(answer);
    Answer added = answerRepository.save(answer);
    return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
  }

  @RequestMapping(value = "/answers/{id}", method = RequestMethod.DELETE)
  public ResponseEntity<String> deleteAnswer(@PathVariable Long id) {
    answerRepository.delete(id);
    return new ResponseEntity(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/answers/{id}", method = RequestMethod.PUT)
  public ResponseEntity<String> updateAnswer(@PathVariable Long id, @RequestBody AnswerData data) {
    Answer updating = answerRepository.findOne(id);
    data.update(updating);
    Answer updated = answerRepository.save(updating);
    return new ResponseEntity(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
  }

  @RequestMapping(value = "/tags", method = RequestMethod.GET)
  public Collection<QTagData> getTags() {
    return new EntityCollectionData<QTagData>(qTagRepository.findAll(), QTagData.class).toDTOCollection();
  }
}
