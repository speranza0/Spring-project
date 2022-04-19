package com.devhyun.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvController {
	
	@GetMapping("/")
	public String main(Model model) {
		return "index";
	}
	
}
