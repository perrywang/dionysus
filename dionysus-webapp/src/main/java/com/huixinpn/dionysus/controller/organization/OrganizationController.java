package com.huixinpn.dionysus.controller.organization;

import com.huixinpn.dionysus.controller.util.PagingHelper;
import com.huixinpn.dionysus.controller.util.Utils;
import com.huixinpn.dionysus.domain.article.Blog;
import com.huixinpn.dionysus.domain.user.OrganizationStatus;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.dto.EntityPageData;
import com.huixinpn.dionysus.dto.article.ArticleData;
import com.huixinpn.dionysus.dto.user.OrganizationDetailData;
import com.huixinpn.dionysus.dto.user.OrganizationSummaryData;
import com.huixinpn.dionysus.repository.article.BlogRepository;
import com.huixinpn.dionysus.repository.user.OrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/controllers/organizations")
public class OrganizationController {

    @Autowired
    private OrganizationRepository organizationRepository;

    @Autowired
    private BlogRepository blogRepository;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.POST)
    public ResponseEntity<String> applyOrganization(@RequestBody OrganizationDetailData data) {
        User updating = organizationRepository.findOne(data.getId());
        data.update(updating);
        updating.setOrganizationStatus(OrganizationStatus.PENDING);
        organizationRepository.save(updating);
        return new ResponseEntity<>(Utils.EMPTY_JSON_OBJECT, HttpStatus.OK);
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public EntityPageData<OrganizationDetailData> getOrganizations(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "status", required = false) String organizationStatus) {
        PageRequest paging = PagingHelper.getPageRequest(page, size);
        Page<User> organizations;
        if (organizationStatus != null) {
            organizations = organizationRepository.findByOrganizationStatus(OrganizationStatus.valueOf(organizationStatus), paging);
        } else {
            organizations = organizationRepository.allOrganizations(paging);
        }
        return new EntityPageData<>(organizations, OrganizationDetailData.class);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public OrganizationSummaryData getOrganization(@PathVariable Long id) {
        User user = organizationRepository.findOne(id);
        return new OrganizationDetailData(user);
    }

    @RequestMapping(value = "/{id}/blogs", method = RequestMethod.GET)
    public EntityPageData<ArticleData> getBlogs(@PathVariable Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        User user = new User(id);
        PageRequest paging = PagingHelper.getPageRequest(page, size);
        Page<Blog> blogs = blogRepository.findOrganizationCreated(user, paging);
        return new EntityPageData<>(blogs, ArticleData.class);
    }
}
