package com.huixinpn.dionysus.controller;

import java.io.IOException;

import com.huixinpn.dionysus.domain.user.User;
import com.huixinpn.dionysus.repository.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.huixinpn.dionysus.storage.StorageException;
import com.huixinpn.dionysus.storage.StorageService;

@RestController
@RequestMapping("/api/v1")
public class FileUploadController {

	private StorageService storage;
    @Autowired
    private UserRepository userRepository;

	@Autowired
	public void setStorageService(StorageService service) {
		this.storage = service;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public @ResponseBody String provideUploadInfo() {
		return "You can upload a file by posting to this same URL.";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody UploadResult handleFileUpload(
			@RequestParam("file") MultipartFile file) throws StorageException {
		if (!file.isEmpty()) {
			try {
				String id = storage.save(file.getBytes());
				String link = storage.url(id);
				return new UploadResult(link);
			} catch (IOException e) {
				throw new StorageException(e.getMessage());
			}
		}
		return new UploadResult("");
	}

    @RequestMapping(value = "/upload/avatar", method = RequestMethod.POST)
    public @ResponseBody UploadResult handleAvatarUpload(@RequestParam("file") MultipartFile file) throws StorageException {

        if(!file.isEmpty()){
            try{
                Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                if (principal instanceof User){
                    User login = (User) principal;
                    User login_data = userRepository.findOne(login.getId());

                    String id = storage.save(file.getBytes());
                    String link = storage.url(id);

                    login_data.setAvatar(link);
                    userRepository.saveAndFlush(login_data);

                    return new UploadResult(link);
                }
            } catch (IOException e){
                throw new StorageException(e.getMessage());
            }
        }

        return new UploadResult("");
    }

}