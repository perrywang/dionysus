package com.huixinpn.dionysus.authorize.aspect;

import com.huixinpn.dionysus.exception.AuthorizeException;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Aspect
public class RepositoryAspect {

  private Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

  @Pointcut("execution(* org.springframework.data.repository.Repository+.*(..))")
  private void anyRepositoryAccess() {
  }

  @Before("anyRepositoryAccess")
  private void generalCheck(JoinPoint jp){
    /*if(!authentication.isAuthenticated()){
      throw new AuthorizeException("Must login first");
    }else{
      String methodName = jp.getSignature().getName();
      Object[] arguments = jp.getArgs();
      String currentUser = authentication.getPrincipal().toString();
      Long userId = (Long)authentication.getDetails();
    }*/
  }

}
