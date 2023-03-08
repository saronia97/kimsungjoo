package mobile.kosmo.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.vo.UpBoardDTO;
import mobile.kosmo.mvc.dao.UpBoardDaoInter;

@Controller
public class DefaultMobileController {
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

	@Autowired
	private UpBoardDaoInter upBoardList;
	
	
	@RequestMapping(value = {"/","/main"})//모바일 페이지일때 맵핑은 이런식으로
	public String defaultMPage(Model model, String cPage) {
		totalRecord = upBoardList.getCnt();
		System.out.println("1. TotalRecord :" + totalRecord);
		// 전체 페이지 출력해보기 => totalPage :2.1
		// double totalPage2 = totalRecord/(double)numPerPage;

		// 올림 => 2.1 => 3
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
		System.out.println("2. totalPage :" + totalPage);

		// totalBlock = totalPage/5;
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		System.out.println("3. totalBlock :" + totalBlock);

		// 현재 페이지를 요청할 때 파라미터로 현재 페이지값을 받는다. 1 ~~~~~~~ n
		String s_page = cPage;
		if (s_page != null) {
			nowPage = Integer.parseInt(s_page);
		}
		System.out.println("4. nowPage :" + nowPage);

		// nowPage의 값에서 SQL문의 #{begin} , #{end} 연산
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		endPerPage = (beginPerPage - 1) + numPerPage;
		System.out.println("5. beginPerPage = " + beginPerPage);
		System.out.println("5. endPerPage = " + endPerPage);
		// 데이터 전송해보기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", beginPerPage);
		map.put("end", endPerPage);
		List<UpBoardDTO> list = upBoardList.getList(map);

		// 페이지 블록안에 페이지 반복 시키기 위한 startPage , endPage를 구해서
		// view로 전달해야 함.
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = startPage + pagePerBlock - 1;
		// endPage의 연산의 범위가 우리가 구한 totalPage값 미만이라면
		// totalPage의 값으로 대입시킨다.
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		System.out.println("6. startPage = " + startPage);
		System.out.println("6. endPage = " + endPage);

		// View에 forward로 전송할 데이터
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage); // 끝 페이지
		model.addAttribute("pagePerBlock", pagePerBlock); // 설정된 5, 한 블록당 페이지 수
		model.addAttribute("totalPage", totalPage);
		return "index";
	}
}
