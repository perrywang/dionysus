package com.huixinpn.dionysus.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
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

}