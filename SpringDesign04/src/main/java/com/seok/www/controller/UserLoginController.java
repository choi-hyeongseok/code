
package com.seok.www.controller;

import javax.inject.Inject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.seok.www.domain.LoginDto;
import com.seok.www.domain.UserVo;
import com.seok.www.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserLoginController {

	@Autowired
	UserService userService;

	@Inject
	BCryptPasswordEncoder pwEncoder;

	/**
	 * user main login process
	 * 
	 * @param loginDto
	 * @return
	 */
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String GET(@ModelAttribute("loginDto") LoginDto loginDto) {
		return "/user/login";
	}

	/**
	 * logout
	 * 
	 * @param request
	 * @param response
	 * @param httpSession
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {

		Object object = httpSession.getAttribute("login");
		if (object != null) {
			//UserVo userVO = (UserVo) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}

		return "/user/logout";
	}

	/**
	 * 로그인 처리
	 * 
	 * @param loginDTO
	 * @param httpSession
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDto loginDTO, HttpSession httpSession, Model model) throws Exception {

		UserVo userVO = userService.login(loginDTO);
		boolean pwdMatch = pwEncoder.matches(loginDTO.getUserPw(), userVO.getUserPw());

		if (loginDTO != null && pwdMatch == true) {
			model.addAttribute("user", userVO);
			userService.updateLoginDate(userVO.getUserNo());
		} else {

		}

	}

	/**
	 * 패스워드 찾기 이메일 전송 처리
	 * 
	 * @param userVo
	 * @param httpSession
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(UserVo userVo, HttpSession httpSession, Model model) throws Exception {

	}

	/**
	 * 아이디 중복 확인
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("userId") String userId) throws Exception {

		return userService.userIdCheck(userId);
	}

}
