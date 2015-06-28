package com.huixinpn.dionysus.domain.psychtest.security;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;

import com.huixinpn.dionysus.AbstractPersistentTest;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.psychtest.PsychTestResultRepository;

public class PsychTestResultsSecurityControlTest extends AbstractPersistentTest {

  @Autowired
  PsychTestResultRepository resultRepository;
  
  User test1;
  User test2;
  
  @Before
  public void setup() {
    test1 = userRepository.findOne(2L);
    test2 = userRepository.findOne(3L);
  }
  
  @Test
  public void testWithSpringSecurityData() {
    SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(test1, "x"));
    List<PsychTestResult> user1SearchResults = resultRepository.findAll();
    Assert.assertEquals(1, user1SearchResults.size());
    
    SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(test2, "x"));
    List<PsychTestResult> user2SearchResults = resultRepository.findAll();
    Assert.assertEquals(0, user2SearchResults.size());

  }
}
