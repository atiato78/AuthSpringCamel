package com.vaibhav.sec.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class GenController {

	@GetMapping("/user")
	@PreAuthorize("hasRole('USER')")
	public response forUser() {
		response test=new response();
		test.setResult("success");
		return test;
	}

	@GetMapping("/admin")
	@PreAuthorize("hasRole('ADMIN')")
	public response forAdmin() {

		response test=new response();
		test.setResult("success-admin");
		return test;
		
	}
	
	

}
