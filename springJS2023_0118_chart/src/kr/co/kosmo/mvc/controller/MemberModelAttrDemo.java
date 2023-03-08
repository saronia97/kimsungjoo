package kr.co.kosmo.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.vo.MemberDemoVO;

@Controller
public class MemberModelAttrDemo {

	// form을 띄우기 위한 메서드 정의 -forward

	// @RequestMapping(value = "/memberForm", method = RequestMethod.GET)
	// only Get방식만 지정 spring 4.x 지원
	//@GetMapping(value = "/memberForm")
	public ModelAndView memberForm() {
		ModelAndView mav = new ModelAndView("member/memberForm");
		return mav;

	}

	// memberIn 처리하는 메서드와 핸들러 매핑을 정의한다.
	// 파라미터 처리 : HttpServletRequest request WAS -> DispatcherServlet
	// -> SpringContainer에 의해서 주입 받는다.
	// @PostMapping(value = "/memberIn")
	public ModelAndView addTest(HttpServletRequest request) {

		System.out.println("ID:" + request.getParameter("id"));
		System.out.println("PWD:" + request.getParameter("pwd"));
		System.out.println("NAME:" + request.getParameter("uname"));

		ModelAndView mav = new ModelAndView("member/success");
		return mav;
	}

	// @PostMapping(value = "/memberIn")
//	public ModelAndView addTest(String id, String pwd, String uname) {
//
//		System.out.println("ID2:" + id);
//		System.out.println("PWD2:" + pwd);
//		System.out.println("NAME2:" + uname);
//
//		ModelAndView mav = new ModelAndView("member/success");
//		return mav;
	// }

	// VO에 파라미터를 알아서 바인딩해서 저장함!
	// @PostMapping(value = "/memberIn")
	public ModelAndView addTest(MemberDemoVO vo) {

		System.out.println("ID3:" + vo.getId());
		System.out.println("PWD3:" + vo.getPwd());
		System.out.println("NAME3:" + vo.getUname());

		ModelAndView mav = new ModelAndView("member/success");
		mav.addObject("vo", vo);
		return mav;
	}

	//@PostMapping(value = "/memberIn")
	public String addTest(Model model,@ModelAttribute(value = "vo") MemberDemoVO vo) {

		System.out.println("@ID3:" + vo.getId());
		System.out.println("@PWD3:" + vo.getPwd());
		System.out.println("NAME3:" + vo.getUname());
		vo.setRdate("2023-01-03"); //@ModelAttribute 사용하면 모델이 수행후 값을 전송하는 것과 같다.
		model.addAttribute("vo",vo);
		// ModelAndView mav = new ModelAndView("member/success");
		// mav.addObject("vo",vo);
		return "member/success";
	}
}
