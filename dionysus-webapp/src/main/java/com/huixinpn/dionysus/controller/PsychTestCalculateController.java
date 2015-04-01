package com.huixinpn.dionysus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class PsychTestCalculateController {
  @RequestMapping(value = "/calculate", method = RequestMethod.POST)
  public void calculate(List<Long> options) {
    //TODO we only need get a list including user selected PsychTestItemOption ids
  }


}
