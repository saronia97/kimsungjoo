package kr.co.kosmo.mvc.controller.param;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RequestParamDemoController {
	// @RequestParam(value) 전달되어오는 파라미터를 체크할 때 사용한다
	// 속성 : value로 정해진 id 즉 파라미터 이름으로 받을 수 있다
	// 해당 파라미터 자체가 없을 때 예외를 발생시킨다
	// MissingServletRequestParameterException
	@RequestMapping(value="/reqparam1", method = RequestMethod.GET)
	public ModelAndView paramDemo1(@RequestParam("id") String code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mytest/testview");
		mav.addObject("msg", code);
		System.out.println("code => "+code);
		return mav;
	}
	
	// required = false : 파라미터 값에 대한 예외를 발생하지 않는다
	// defalufValue="" 파라미터값이 없을 때 기본 값으로 설정
	@RequestMapping(value="/reqparam2", method = RequestMethod.GET)
	public ModelAndView paramDemo2(@RequestParam(value="id", required = false, defaultValue = "xman") String code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mytest/testview");
		mav.addObject("msg", code);
		System.out.println("code => "+code);
		return mav;
	}
}
