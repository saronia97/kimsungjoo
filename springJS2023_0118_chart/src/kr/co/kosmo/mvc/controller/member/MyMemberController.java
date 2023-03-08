package kr.co.kosmo.mvc.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.BoardVO;
import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.UpBoardDTO;

@Controller
@RequestMapping("/member")
public class MyMemberController {
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	// ----------------------------------
		// Page처리를 위한 속성
		private int nowPage = 1; // 현재 페이지 값 -> 메뉴페이지와 연동되는 변수
		private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block
		private int totalRecord; // 총 게시물 수 .Dao로 부터 받음
		private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
		private int pagePerBlock = 5; // 한 블럭당 보여질 페이지 수
		private int totalPage; // 전체 페이지 수 => totalRecord/numPerPage
		private int totalBlock; // 전체 블럭 수
		private int beginPerPage; // 각 페이지별 시작 게시물의 index값
		private int endPerPage; // 각 페이지별 마지막 게시물의 index값
		// ----------------------------------

	
	
	@GetMapping(value="/memberForm")
	public ModelAndView memberForm() {
		ModelAndView mav = new ModelAndView("mymember/memberForm");
		return mav;
	}
	
	
	// return String 일 경우에는 viewName 전달, Model 인자로 보낼 수 있다
	@PostMapping(value="/memberIn")
	public String memberIn(MemberDTO dto) {
		// test용
		System.out.println("ID : "+dto.getId());
		// 인터페이스를 사용한 입력메서드 호출!
		memberDaoInter.addMember(dto);
		// 회원가입이 끝나고 나면 이동할 페이지 설정 - redirect
		return "redirect:/web/main";
	}
	

	@GetMapping(value = "/loginForm")
	public String login() {
		return "mymember/login";
	}
	
	@PostMapping(value = "/login")
	public String login(MemberDTO dto,HttpServletRequest request) {
		String viewName = null;
		int cnt = memberDaoInter.login(dto);
		if (cnt > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", dto.getId());
			viewName = "redirect:/main";
		}else {
			viewName="redirect:loginForm";
		}
		return viewName;
	}
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("id");
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberList")
	public String listMember(Model model, String cPage) {
		totalRecord = memberDaoInter.getCnt();
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		String s_page = cPage;
		if (s_page != null) {
			nowPage = Integer.parseInt(s_page);
		}
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		endPerPage = (beginPerPage - 1) + numPerPage;
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		List<MemberDTO> list = memberDaoInter.listMember(map);
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage); // 끝 페이지
		model.addAttribute("pagePerBlock", pagePerBlock); // 설정된 5, 한 블록당 페이지 수
		model.addAttribute("totalPage", totalPage);
		
		return "mymember/memberList";
	}
	
	@GetMapping(value="/detailmember")
	public ModelAndView detailmember(int num) {
		ModelAndView mav = new ModelAndView("mymember/memberDetail");
		MemberDTO vo = memberDaoInter.detailmember(num);
		mav.addObject("vo", vo);
		return mav;
	}
	
}
