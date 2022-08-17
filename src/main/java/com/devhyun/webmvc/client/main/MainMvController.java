package com.devhyun.webmvc.client.main;

import com.devhyun.webmvc.common.core.MvController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@MvController
public class MainMvController {
	
	@GetMapping("/")
	public String main(Model model) throws Exception {
		//throw new Exception("에러");
		return "index";
	}
	
}
