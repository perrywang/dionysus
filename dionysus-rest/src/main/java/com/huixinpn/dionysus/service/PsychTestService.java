package com.huixinpn.dionysus.service;

import com.huixinpn.dionysus.repository.PsychTestRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "tests", path = "tests")
public interface PsychTestService extends PsychTestRepository {
}
