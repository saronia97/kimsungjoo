package kr.co.kosmo.mvc.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

@Controller
@RequestMapping(value = "/login")
public class LoginCheckController {
	@Autowired
	public MemberDaoInter MemberDaoInter;
	
	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}

	
	//폼에서 전송되어 온 파라미터의 값을 기준으로 데이터 베이스에서
	//인증된 회원이면 세션의 값을 저장하고, 아니면 오류 메세지를 보여줘야 하지않나
	//String UserAgent : Acspect에서 받을 데이터 -> @requestHeader("User-Agent")
	@PostMapping(value = "/loginProcess")
	public ModelAndView loginfProcess(HttpSession session,HttpServletRequest request,MemberDTO vo,
			
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("User-Agent : "+userAgent);
		ModelAndView mav = new ModelAndView("redirect:/web/main");
		MemberDTO dto = MemberDaoInter.loginCheck(vo);
		
		if(dto.getId().equals(dto.getId()) && dto.getPwd().equals(dto.getPwd())) {//login success
			session.setAttribute("sessionName", dto.getName());
			session.setAttribute("sessionID",dto.getId());
			System.out.println("로그인 실행! 및 세션 저장 -> Proceeding Call");
		}else {
			mav.setViewName("error/paramException");
			mav.addObject("emsg","로그인 실패입니다.");
		}
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//session.invalidate(); session청소하는 명령어 왠만해서 물어보고 써야한다.
		session.removeAttribute("sessionName");
		session.removeAttribute("sessionID");
		mav.setViewName("redirect:/web/main");
		System.out.println("로그인 실행! 및 세션 저장 -> Proceeding Call");
		return mav;
	}
}
