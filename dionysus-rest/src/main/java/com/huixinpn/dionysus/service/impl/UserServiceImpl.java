package com.huixinpn.dionysus.service.impl;

import com.huixinpn.dionysus.domain.*;
import com.huixinpn.dionysus.domain.article.Article;
import com.huixinpn.dionysus.domain.article.Category;
import com.huixinpn.dionysus.domain.article.Comment;
import com.huixinpn.dionysus.domain.user.Role;
import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.exception.InvalidUserException;
import com.huixinpn.dionysus.repository.ArticleRepository;
import com.huixinpn.dionysus.repository.CategoryRepository;
import com.huixinpn.dionysus.repository.CommentRepository;
import com.huixinpn.dionysus.repository.UserRepository;
import com.huixinpn.dionysus.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {


  @Autowired
  @Qualifier("userRepository")
  private UserRepository userrepository;

  @Autowired
  @Qualifier("articleRepository")
  private ArticleRepository articlerepository;

  @Autowired
  @Qualifier("commentRepository")
  private CommentRepository commentrepository;

  @Autowired
  @Qualifier("categoryRepository")
  private CategoryRepository categoryRepository;

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
    user.setProfile(null);
    userrepository.save(user);
    manager.detach(user);
    user.setPassword("");
    user.setEncryptedPassword("");
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
    userrepository.saveAndFlush(_user);
    manager.detach(_user);
    _user.setPassword("");
    _user.setEncryptedPassword("");
    return _user;
  }
  
  @Override
  public User sign(String username, String password) {
    User user = userrepository.findByUsername(username);
    if (user == null || !encoder.matches(password, user.getEncryptedPassword())) {
      throw new InvalidUserException("invalid user: " + username);
    }

    manager.detach(user);
    user.setPassword("");
    user.setEncryptedPassword("");
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
  public User notifyuser(User user, String summary) {
    User admin = userrepository.findByUsername("admin");
    Article article = new Article(summary, summary);
    Category category = categoryRepository.findByname("notification");
    if (category == null)
      category = new Category("notification");
    article.setCategory(category);
    article.setCreatedBy(user);
    article.setLastModifiedBy(admin);
    articlerepository.save(article);
    Comment comment = new Comment("from " + user.getUsername(), article);
    commentrepository.save(comment);
    return admin;
  }

  @Override
  public boolean sendemailtouser(User user) {
//		String to = user.getEmail();
//	    String from = "web@gmail.com";
//	    String host = "localhost";
//	    Properties properties = System.getProperties();
//	    properties.setProperty("mail.smtp.host", host);
//	    Session session = Session.getDefaultInstance(properties);

//	    try{
//	    	MimeMessage message = new MimeMessage(session);
//	        message.setFrom(new InternetAddress(from));
//	        message.addRecipient(Message.RecipientType.TO,	       
//	        message.setSubject("This is the Subject Line!");	        
//	        message.setContent("<h1>This is actual message</h1>",
//	                            "text/html" );
    // Send message
//	        Transport.send(message);
//	    }catch (MessagingException mex) {
//	         mex.printStackTrace();
//	    }
    return true;
  }
}
