package org.dionysus.domain.event;

import java.util.List;

public interface Notifiable<U> {

	U receiveFrom();
	
	List<U> sendTo();
	
	String getSummary();
}
