package com.devhyun.webmvc.client.main;

import com.devhyun.webmvc.common.core.AuthUser;
import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.services.user.UserVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@MvController
public class MainMvController {
	
	@GetMapping("/")
	public String main(Model model, @AuthUser UserVO user) throws Exception {
		System.out.println(user);
		return "index";
	}
	
}
