/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.dionysus.common.event;

import java.util.Date;

/**
 *
 * @author wangpeng, 
 * Any domain event should implement this interface such as QuestionAnswered and then call EventService to publish.
 * There is a StoredEvent class in model package to store serilized DomainEvent with universal json format
 */
public interface DomainEvent { 
    Date occuredOn();
}
