package com.huixinpn.dionysus.controller.psychtest;

import com.huixinpn.dionysus.domain.psychtest.*;
import com.huixinpn.dionysus.dto.psychtest.PsychTestData;
import com.huixinpn.dionysus.dto.psychtest.PsychTestItemData;
import com.huixinpn.dionysus.dto.psychtest.PsychTestingSelectionData;
import com.huixinpn.dionysus.repository.PsychTestItemRepository;
import com.huixinpn.dionysus.repository.PsychTestRepository;
import com.huixinpn.dionysus.repository.PsychTestingRepository;
import com.huixinpn.dionysus.repository.PsychTestingSelectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
public class TestingController {

  @Autowired
  private PsychTestRepository testRepository;

  @Autowired
  private PsychTestItemRepository testItemRepository;

  @Autowired
  private PsychTestingRepository testingRepository;

  @Autowired
  private PsychTestingSelectionRepository selectionRepository;

  @RequestMapping(value = "/testing", method = RequestMethod.GET)
  public
  @ResponseBody
  ResponseEntity<PsychTestData> startTesting(@RequestParam Long tid) { //must have /testing?tid= format to start a testing against PsychTest.getId() == tid
    PsychTest test = testRepository.findOne(tid);
    if (test == null) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    PsychTesting testing = new PsychTesting();
    testing.setTest(test);
    testing.setState(PsychTestingState.IN_PROGRESS);
    testing = testingRepository.save(testing);
    PsychTestData result = new PsychTestData(test);
    result.setTesting_id(testing.getId());
    return new ResponseEntity<>(result, HttpStatus.OK);
  }

  @RequestMapping(value = "/testings/{id}", method = RequestMethod.GET)
  public
  @ResponseBody
  ResponseEntity<PsychTestData> getTesting(@PathVariable Long id) {
    PsychTesting testing = testingRepository.findOne(id);
    if (testing == null || testing.getState() == PsychTestingState.CANCELED) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    } else if (testing.getState() == PsychTestingState.IN_PROGRESS) {
      PsychTest test = testing.getTest();
      PsychTestData result = new PsychTestData(test);
      result.setTesting_id(id);
      ArrayList<PsychTestingSelection> historySelections = (ArrayList<PsychTestingSelection>) testing.getSelections();
      int lastAnsweredIndex = historySelections.size() - 1;
      if(lastAnsweredIndex > -1){
        result.setLastAnswered(historySelections.get(lastAnsweredIndex).getSelected().getId());
      }
      return new ResponseEntity<>(result, HttpStatus.OK);
    } else {
      return new ResponseEntity<>(HttpStatus.OK); //TODO goto testing result page
    }
  }

  @RequestMapping(value = "/testings/{id}", method = {RequestMethod.PUT,RequestMethod.POST})
  public
  @ResponseBody
  ResponseEntity<Void> finishTesting(@PathVariable Long id) {
    PsychTesting testing = testingRepository.findOne(id);
    if (testing == null || testing.getState() == PsychTestingState.CANCELED) {
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    } else if (testing.getState() == PsychTestingState.IN_PROGRESS) {
      testing.setState(PsychTestingState.FINISHED);
      testingRepository.save(testing);
      return new ResponseEntity<>(HttpStatus.OK); // TODO calculating and display testing result page
    } else {
      return new ResponseEntity<>(HttpStatus.OK); //TODO directly goto testing result page
    }
  }


  @RequestMapping(value = "/testings/{id}/{item_id}", method = RequestMethod.GET)
  public
  @ResponseBody
  ResponseEntity<PsychTestItemData>
  gotoItem(@PathVariable Long id, @PathVariable Long item_id, @RequestParam(required = false) boolean answered) {
    PsychTestItemData itemData = new PsychTestItemData(testItemRepository.findOne(item_id));
    if (answered) {
      PsychTestingSelection selection = selectionRepository.findByTestingAndItem(id, item_id);
      itemData.setSelected(selection.getSelected().getId());
    }
    return new ResponseEntity<>(itemData, HttpStatus.OK);
  }

  @RequestMapping(value = "/testings/{id}/{item_id}", method = {RequestMethod.POST,RequestMethod.PUT})
  public
  @ResponseBody
  ResponseEntity<Void>
  saveAnswer(@PathVariable Long id, @PathVariable Long item_id, @RequestBody PsychTestingSelectionData selectionData) {
    PsychTestingSelection selection = selectionRepository.findByTestingAndItem(id, item_id);
    if (selection != null) {
      selection.setSelected(new PsychTestItemOption(selectionData.getOption_id()));
      selection.setAnswer(selectionData.getAnswer());
      selectionRepository.save(selection);
    } else {
      selection = new PsychTestingSelection();
      selection.setTesting(new PsychTesting(id));
      selection.setItem(new PsychTestItem(item_id));
      selection.setSelected(new PsychTestItemOption(selectionData.getOption_id()));
      selection.setAnswer(selectionData.getAnswer());
      selectionRepository.save(selection);
    }
    return new ResponseEntity<>(HttpStatus.OK);
  }
}
