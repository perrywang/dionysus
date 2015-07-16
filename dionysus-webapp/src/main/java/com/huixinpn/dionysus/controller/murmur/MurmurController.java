package com.huixinpn.dionysus.controller.murmur;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.controller.util.Utils;
import com.huixinpn.dionysus.domain.murmur.Murmur;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.murmur.MurmurData;
import com.huixinpn.dionysus.repository.murmur.MurmurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/controllers/murmurs")
public class MurmurController {

    @Autowired
    private MurmurRepository murmurRepository;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public EntityPageData<MurmurData> getAllMurmurs(@RequestParam(value = "page", required = false) Integer page,
                                                    @RequestParam(value = "size", required = false) Integer size) {
        PageRequest paging = PagingHelper.getPageRequest(page, size);
        Page<Murmur> murmurs = murmurRepository.findAll(paging);
        return new EntityPageData<>(murmurs, MurmurData.class);
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.POST)
    public ResponseEntity<String> addMurmur(@RequestBody MurmurData data) {
        Murmur murmur = new Murmur();
        murmur.setContent(data.getContent());
        Murmur added = murmurRepository.save(murmur);
        return new ResponseEntity<>(Utils.wrapSaveResult(added.getId()), HttpStatus.OK);
    }

    @RequestMapping(value = "/me", method = RequestMethod.GET)
    public EntityPageData<MurmurData> myQuestions(@RequestParam(value = "page", required = false) Integer page,
                                                  @RequestParam(value = "size", required = false) Integer size) {
        PageRequest paging = PagingHelper.getPageRequest(page, size);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User login = (User) authentication.getPrincipal();
        Page<Murmur> murmurs = murmurRepository.findByCreatedBy(login, paging);
        return new EntityPageData<>(murmurs, MurmurData.class);
    }

}
