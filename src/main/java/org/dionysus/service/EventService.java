/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.dionysus.service;

import org.dionysus.common.event.DomainEvent;

/**
 *
 * @author pengwang
 */
public interface EventService {
    void publishEvent(DomainEvent event);
}
