package org.dionysus.domain.event;

import java.util.Collection;

public interface Notifiable<U> {

	U receiveFrom();
	
	Collection<U> sendTo();
	
	String getSummary();
}
