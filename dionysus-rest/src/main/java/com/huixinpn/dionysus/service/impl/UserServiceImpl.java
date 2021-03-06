package com.huixinpn.dionysus.service.impl;

import com.huixinpn.dionysus.domain.user.Consultant;
import com.huixinpn.dionysus.domain.user.Profile;
import com.huixinpn.dionysus.domain.user.Role;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.exception.InvalidUserException;
import com.huixinpn.dionysus.repository.user.ConsultantRepository;
import com.huixinpn.dionysus.repository.user.UserRepository;
import com.huixinpn.dionysus.service.ConsultantService;
import com.huixinpn.dionysus.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import java.util.HashMap;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService, ConsultantService {


    @Autowired
    @Qualifier("userRepository")
    private UserRepository userrepository;

    @Autowired
    @Qualifier("consultantRepository")
    private ConsultantRepository consultantRepository;

    @Autowired
    private PasswordEncoder encoder;

    @PersistenceContext
    private EntityManager manager;

    @Override
    public User register(User user) {
        User _user = userrepository.findByUsername(user.getUsername());
        if (_user != null) {
            throw new InvalidUserException("user " + user.getUsername() + " exists!");
        }

        HashSet<Role> roles = new HashSet<Role>();
        roles.add(new Role("ROLE_USER"));
        user.setRoles(roles);
        //user.setInbox(null);
        user.setProfile(new Profile());
        user.setAbout("普通用户");
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(new UsernamePasswordAuthenticationToken(user.getUsername(),
                user.getPassword(), user.getAuthorities()));
        userrepository.save(user);
        manager.detach(user);
        user.setPassword("");
        user.setEncryptedPassword("");
        user.setCourses(null);
        return user;
    }

    @Override
    public User updateprofile(User user) {
        User _user = userrepository.findByUsername(user.getUsername());
        if (_user == null) {
            throw new InvalidUserException("user " + user.getUsername() + " doesn't exists!");
        }
        _user.setEmail(user.getEmail());
        _user.setAddress(user.getAddress());
        _user.setGender(user.getGender());
        _user.setMobile(user.getMobile());
        _user.setLandline(user.getLandline());
        _user.setAge(user.getAge());
        _user.setQq(user.getQq());
        _user.setQqAddress(user.getQqAddress());
        _user.setRealName(user.getRealName());
        _user.setAbout(user.getAbout());
        userrepository.saveAndFlush(_user);
        manager.detach(_user);
        _user.setPassword("");
        _user.setEncryptedPassword("");
        _user.setCourses(null);
        _user.setProfile(null);
        if (_user instanceof Consultant) {
            ((Consultant) _user).setTeachings(null);
            ((Consultant) _user).setAppointments(null);
        }
        return _user;
    }

    @Override
    public User sign(String username, String password) {
        User user = userrepository.findByUsername(username);

        if (user == null) {
            throw new InvalidUserException("用户不存在:" + username);
        }

        if (!encoder.matches(password, user.getEncryptedPassword())) {
            throw new InvalidUserException("密码错误: " + username);
        }

        if (!(user.isAccountNonExpired() && user.isAccountNonLocked() && user.isCredentialsNonExpired() && user.isEnabled())) {
            throw new InvalidUserException("用户未生效: " + username);
        }

        manager.detach(user);
        user.setPassword("");
        user.setEncryptedPassword("");
        user.setCourses(null);
        user.setProfile(null);
        if (user instanceof Consultant) {
            ((Consultant) user).setTeachings(null);
            ((Consultant) user).setAppointments(null);
            ((Consultant) user).setExpertises(null);
        }
        return user;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userrepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("user not found: " + username);
        }
        manager.detach(user);
        user.setPassword("");
        user.setEncryptedPassword("");
        return user;
    }

    @Override
    public User registerconsultant(User consultant) {
        Consultant _consultant = new Consultant(consultant.getUsername(), consultant.getPassword());
        HashSet<Role> roles = new HashSet<Role>();
        roles.add(new Role("ROLE_CONSULTANT"));
        _consultant.setRoles(roles);
        _consultant.setEmail(consultant.getEmail());
        _consultant.setEnabled(false);
        _consultant.setAbout("心理咨询师");
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(new UsernamePasswordAuthenticationToken(_consultant.getUsername(),
        		_consultant.getPassword(), _consultant.getAuthorities()));
        consultantRepository.save(_consultant);
        manager.detach(_consultant);
        _consultant.setPassword("");
        _consultant.setEncryptedPassword("");
        _consultant.setCourses(null);
        return _consultant;
    }

    @Override
    public boolean sendemailtouser(User user) {
        return true;
    }


    @Override
    public void changePassword(String oldPass, String newPass, HashMap revalue) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof User){
            User user = (User) principal;
            User user_data = userrepository.findOne(user.getId());
            if(!encoder.matches(oldPass, user_data.getEncryptedPassword())){
                revalue.put("status", "fail_pass");
            }
            else{
                user_data.setEncryptedPassword(encoder.encode(newPass));
                user_data.setPassword(newPass);
                userrepository.saveAndFlush(user_data);
                revalue.put("status","success");
            }
        }
    }
}
