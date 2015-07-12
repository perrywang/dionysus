package com.huixinpn.dionysus.controller.psychtest;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huixinpn.dionysus.domain.psychtest.PsychTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.repository.psychtest.PsychTestRepository;
import com.huixinpn.dionysus.repository.psychtest.PsychTestResultRepository;

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
}
