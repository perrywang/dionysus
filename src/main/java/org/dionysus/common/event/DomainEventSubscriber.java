/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.dionysus.common.event;

/**
 *
 * @author pengwang, used to register to event publisher for handling published events, for every domainevent such as
 * QuestionAnswered you should has class QuestionAnsweredScribiber implements this generic interface 
 * @param <T> 
 */
public interface DomainEventSubscriber<T> {

    public void handleEvent(final T aDomainEvent);

    public Class<T> subscribedToEventType();
}
