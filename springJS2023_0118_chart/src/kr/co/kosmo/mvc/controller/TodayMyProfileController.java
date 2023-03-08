package kr.co.kosmo.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodayMyProfileController {
	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public ModelAndView todayProfile() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("profile", "나는 스프링의 김길동이다!");
		mav.setViewName("today/todayProfile");
		return mav;
	}

	@RequestMapping(value = "/todaywk", method = RequestMethod.GET)
	public ModelAndView todayWork() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("work", "엄청 쉬운 작업입니다. 날짜를 적용하세요");
		mav.setViewName("today/todayWork");
		return mav;
	}
}
