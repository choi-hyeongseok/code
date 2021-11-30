
package com.seok.www.controller;


import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;
import com.seok.www.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Inject
	BCryptPasswordEncoder pwEncoder;

	/**
	 * 회원가입 페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/user/register";
	}

	/**
	 * 회원가입 처리
	 * @param userVo
	 * @param reiAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registerPOST(UserVo userVo, RedirectAttributes reiAttributes) throws Exception {

		int result = 1;
		String inputPass = userVo.getUserPw();
		String pwd = pwEncoder.encode(inputPass);
		userVo.setUserPw(pwd);
		userService.register(userVo);
		reiAttributes.addFlashAttribute("msg", "REGISTERED");

		return "redirect:/user/login";
	}

	/**
	 * 회원 정보 페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPageGET() throws Exception {
		return "/user/mypage";
	}
	
	/**
	 * 회원 정보 수정 페이지
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET() throws Exception {
		return "/user/modify";
	}

	
	/**
	 * 회원 정보 수정 처리
	 * @param userVo
	 * @param reiAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(UserVo userVo, RedirectAttributes reiAttributes) throws Exception {

//		String hashedPw = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt());
//		userVo.setUserPw(hashedPw);
		userService.userUpdate(userVo);
		reiAttributes.addFlashAttribute("msg", "REGISTERED");

		return "redirect:/user/login";
	}
	

}
