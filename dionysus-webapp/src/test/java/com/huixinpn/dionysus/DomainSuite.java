package com.huixinpn.dionysus;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	ArticleDomainTest.class, 
	NotificationTest.class,
	UserPasswordEncodeTest.class
})
public class DomainSuite {

}
