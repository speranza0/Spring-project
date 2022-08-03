package com.devhyun.webmvc.client.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainMvController {
	
	@GetMapping("/")
	public String main(Model model) throws Exception {
		//throw new Exception("에러");
		return "index";
	}
	
}
