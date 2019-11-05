package com.wan.basis.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wan.basis.dto.JoinUser;
import com.wan.basis.service.EmailSenderService;
import com.wan.basis.service.JoinService;


@Controller
public class JoinController {
	
	@Autowired
    private EmailSenderService emailSender;
	
	@Autowired
    private JoinService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/join_content")
	public String join() {
		
		return "join/joinAgreeUser";
	}
	@RequestMapping(value = "/joinAgreeUser", method = RequestMethod.POST)
	public String signupAgreeUser() {
		return "/join/joinUser";
	} 
	
	@RequestMapping(value = "/joinUser", method = RequestMethod.GET)
	public String signupUser(Model model, HttpServletRequest request, JoinUser juser) throws Exception {
		String bcryptPw = null;
		String email = request.getParameter("e1")+"@"+request.getParameter("e2");
		String address= request.getParameter("zip_code")+", "+request.getParameter("a1")+" "+request.getParameter("a2");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String bcryptPassword = passwordEncoder.encode(password);
		bcryptPw = bcryptPassword;
		
		String result= emailSender.SendEmail(email, name, request);
		
		juser.setEmail(email);
		juser.setAddress(address);
		juser.setName(name);
		juser.setPassword(bcryptPw);
		juser.setCheckEmail(result);
		
		service.insertUser(juser);
		model.addAttribute("name",name);
		
		return "/join/joinUserRes";
	}
	
	@RequestMapping(value="key_alter", method = RequestMethod.GET)
	public ModelAndView key_alterConfirm(@RequestParam("email") String email, 
			@RequestParam("checkEmail") String checkEmail) {
		
		logger.info("email : "+email,"checkEmail:"+checkEmail);
		
//		service.joinSuccess(email,checkEmail);
		
		ModelAndView mav= new ModelAndView();
		
		mav.setViewName("/join/joinUserSuccess");
   		mav.addObject("email",email);
   		
		return mav;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		logger.info("Login Page", locale);
		
		return "login/loginForm";
	}
	
	@RequestMapping(value = "/login_check", method = RequestMethod.POST)
	public ModelAndView login_check(HttpServletRequest request, Model model,JoinUser juser, HttpSession session) {
		logger.info("Login_check Page");
		
		String password = request.getParameter("password");
		String pw = service.getPw(juser.getEmail());
		
		boolean isValidPassword = BCrypt.checkpw(password, pw);
		
		ModelAndView mav= new ModelAndView();
		JoinUser user=service.allInfo(juser.getEmail());
		
		if(isValidPassword==true) {
			mav.setViewName("/index");
   			mav.addObject("user",user);
   			session.setAttribute("user",user);
   			return mav;
		}
		else {
			String msg = "Login_Fail";
			mav.setViewName("login/loginForm");
			mav.addObject("msg",msg);
			return mav;
		}
		
	}
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
   	 public String logout(){	
		 
   		 return "/login/logout"; 
   	 }
}

