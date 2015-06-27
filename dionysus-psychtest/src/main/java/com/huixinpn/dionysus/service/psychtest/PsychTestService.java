package com.huixinpn.dionysus.service.psychtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.huixinpn.dionysus.repository.psychtest.PsychTestRepository;

@RestController
@RequestMapping("/services/psychtests")
public class PsychTestService {

	@Autowired
	private PsychTestRepository testRepository;
//	
//	@RequestMapping(method = RequestMethod.GET)
//	public Iterable<PsychTest> findAllTests() {
//    return testRepository.findAll();
//	}
}
