package kr.co.kosmo.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.vo.BoardVO;

@Controller
public class BoardController {
//1 boardForm
	@GetMapping(value = "/boardForm")
	public ModelAndView boardForm() {
		ModelAndView mav = new ModelAndView("board/boardForm");
		return mav;
	}
//2. boardIn
	@PostMapping(value = "/boardIn")
	public ModelAndView boardIn() {
		ModelAndView mav = new ModelAndView("redirect:boardList");
		return mav;
	}
//3. boardList
	@GetMapping(value = "/boardList")
	public String boardList(Model model, @ModelAttribute(value = "list") ArrayList<BoardVO> list) {
		
		for (int i = 0; i < 10; i++) {
			BoardVO vo = new BoardVO();
			vo.setNum(i+1);
			//vo.setTitle("¿À´Ã½È¾î" + i);
			vo.setWriter("rlarlfehd" + i);
			vo.setBdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			list.add(vo);
		}
		
		return "board/boardList";
	}
}
