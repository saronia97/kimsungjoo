package kr.co.kosmo.mvc.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;

//@RestController = json , 값을 커스텀 뷰로 전달하는 목적

@RestController
public class IdCheckController {
	@Autowired
	private MemberDaoInter memberDaoInter;

	@GetMapping(value = "/idcheck")
	public int idCheck(Model model, @RequestParam String id) {
		System.out.println("id ajax : " + id);
		int cnt = memberDaoInter.idcheck(id);
		model.addAttribute("msg", cnt);
		return cnt;
	}
}
