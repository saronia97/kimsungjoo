package kr.co.kosmo.mvc.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MyBoardDaoInter;
import kr.co.kosmo.mvc.vo.BoardVO;

@Controller
@RequestMapping(value="/mboard")
public class MyBoardController {
	@Autowired
	private MyBoardDaoInter myBoardDaoInter;
	
	@GetMapping(value="/mboardForm")
	public ModelAndView myboardForm() {
		ModelAndView mav = new ModelAndView("board/boardForm");
		return mav;
	}
	
	@PostMapping(value="/boardIn")
	public String addBoard(BoardVO vo) {
		myBoardDaoInter.addBoard(vo);
		return "redirect:mboardlist";
	}
	
	@GetMapping(value="/mboardlist")
	public ModelAndView listBoard() {
		ModelAndView mav = new ModelAndView("board/boardList");
		List<BoardVO> list = myBoardDaoInter.listBoard();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping(value="/mboardDetail")
	public ModelAndView detailBoard(int num) {
		ModelAndView mav = new ModelAndView("board/boardDetail");
		BoardVO vo = myBoardDaoInter.detailBoard(num);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@GetMapping(value="/boardDel")
	public String deleteBoard(int num) {
		System.out.println("num => "+num);
		myBoardDaoInter.delBoard(num);
		return "redirect:mboardlist";
	}
}
