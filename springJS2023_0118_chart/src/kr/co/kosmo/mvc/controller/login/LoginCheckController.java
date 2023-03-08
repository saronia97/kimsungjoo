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

	
	//������ ���۵Ǿ� �� �Ķ������ ���� �������� ������ ���̽�����
	//������ ȸ���̸� ������ ���� �����ϰ�, �ƴϸ� ���� �޼����� ������� �����ʳ�
	//String UserAgent : Acspect���� ���� ������ -> @requestHeader("User-Agent")
	@PostMapping(value = "/loginProcess")
	public ModelAndView loginfProcess(HttpSession session,HttpServletRequest request,MemberDTO vo,
			
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("User-Agent : "+userAgent);
		ModelAndView mav = new ModelAndView("redirect:/web/main");
		MemberDTO dto = MemberDaoInter.loginCheck(vo);
		
		if(dto.getId().equals(dto.getId()) && dto.getPwd().equals(dto.getPwd())) {//login success
			session.setAttribute("sessionName", dto.getName());
			session.setAttribute("sessionID",dto.getId());
			System.out.println("�α��� ����! �� ���� ���� -> Proceeding Call");
		}else {
			mav.setViewName("error/paramException");
			mav.addObject("emsg","�α��� �����Դϴ�.");
		}
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//session.invalidate(); sessionû���ϴ� ��ɾ� �ظ��ؼ� ����� ����Ѵ�.
		session.removeAttribute("sessionName");
		session.removeAttribute("sessionID");
		mav.setViewName("redirect:/web/main");
		System.out.println("�α��� ����! �� ���� ���� -> Proceeding Call");
		return mav;
	}
}
