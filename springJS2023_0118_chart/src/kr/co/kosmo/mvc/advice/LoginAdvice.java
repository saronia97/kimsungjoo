package kr.co.kosmo.mvc.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;

@Component
@Aspect
public class LoginAdvice {
	private String userAgent;

	@Autowired
	private MemberDaoInter memberList;

	@Around("execution(* kr.co.kosmo.mvc.controller.login.LoginCheckController.loginf*(..))")
	private ModelAndView loginLogger(ProceedingJoinPoint jp) {
		System.out.println("����1");
		ModelAndView rpath = null;
		// step1)�޼����� �̸��� �����ͼ� �α��ΰ� �α׾ƿ��� �����Ѵ�.
		String methodName = jp.getSignature().getName();
		System.out.println("methodName->" + methodName);

		// step2) Joinpoint�� ���� Ÿ�� ��ü�� �޼����� ���ڰ� �޾ƿ���
		Object[] fd = jp.getArgs();
//		for(Object e : fd) {
//			System.out.println(e.getClass().getName());
//		}

		if (methodName.equals("loginfProcess")) {

			try {
				rpath = (ModelAndView) jp.proceed();// login �޼��� ȣ��!
			} catch (Throwable e) {
				e.printStackTrace();
			}

			// getArgs : ����,DTO,userAgnet,userAgent - 4��
			HttpSession session = (HttpSession) fd[0];
			userAgent = (String) fd[3];
			String reip = ((HttpServletRequest) (fd[1])).getRemoteAddr();
			String uid = (String) session.getAttribute("sessionID");
			System.out.println("agent = >" + userAgent);
			System.out.println("agent = > " + userAgent);
			System.out.println("reip = >" + reip);
			// �α��� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("login");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberList.addLoginLogging(vo);
		} else if (methodName.equals("loginfoutProcess")) {
			// getArgs : ����, request - 2��
			HttpSession session = (HttpSession) fd[0];
			String uid = (String) session.getAttribute("sessionID");
			String reip = ((HttpServletRequest) fd[1]).getRemoteAddr();
			// �α׾ƿ� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("logout");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberList.addLoginLogging(vo);
			try {
				rpath = (ModelAndView) jp.proceed(); // logout �޼��带 ȣ��
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}

		return rpath;
	}
}
