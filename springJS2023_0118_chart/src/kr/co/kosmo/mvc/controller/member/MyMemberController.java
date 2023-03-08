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
		// Pageó���� ���� �Ӽ�
		private int nowPage = 1; // ���� ������ �� -> �޴��������� �����Ǵ� ����
		private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block
		private int totalRecord; // �� �Խù� �� .Dao�� ���� ����
		private int numPerPage = 10; // �� �������� ������ �Խù� ��
		private int pagePerBlock = 5; // �� ���� ������ ������ ��
		private int totalPage; // ��ü ������ �� => totalRecord/numPerPage
		private int totalBlock; // ��ü �� ��
		private int beginPerPage; // �� �������� ���� �Խù��� index��
		private int endPerPage; // �� �������� ������ �Խù��� index��
		// ----------------------------------

	
	
	@GetMapping(value="/memberForm")
	public ModelAndView memberForm() {
		ModelAndView mav = new ModelAndView("mymember/memberForm");
		return mav;
	}
	
	
	// return String �� ��쿡�� viewName ����, Model ���ڷ� ���� �� �ִ�
	@PostMapping(value="/memberIn")
	public String memberIn(MemberDTO dto) {
		// test��
		System.out.println("ID : "+dto.getId());
		// �������̽��� ����� �Է¸޼��� ȣ��!
		memberDaoInter.addMember(dto);
		// ȸ�������� ������ ���� �̵��� ������ ���� - redirect
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
		model.addAttribute("endPage", endPage); // �� ������
		model.addAttribute("pagePerBlock", pagePerBlock); // ������ 5, �� ��ϴ� ������ ��
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
