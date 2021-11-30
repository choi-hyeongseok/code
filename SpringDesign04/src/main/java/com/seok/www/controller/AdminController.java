package com.seok.www.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seok.www.domain.UserVo;
import com.seok.www.service.UserService;


@Controller
@RequestMapping("/user")
public class AdminController {

	@Autowired
	UserService userService;
	
	/**
	 * 관리자 - 사용자 정보 리스트 페이지
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	String boardList(Model model) {
		try {
			model.addAttribute("list", userService.selectList());
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return "/admin/list";
	}
	
	
	
}
