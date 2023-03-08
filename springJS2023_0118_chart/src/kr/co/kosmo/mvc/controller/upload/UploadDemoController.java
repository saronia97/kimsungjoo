package kr.co.kosmo.mvc.controller.upload;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.UpBoardDaoInter;
import kr.co.kosmo.mvc.vo.UpBoardDTO;

@Controller
@RequestMapping(value = "/upload")
public class UploadDemoController {

	@Autowired
	private UpBoardDaoInter upBoardList;
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

	@GetMapping(value = "/upform")
	public String upform() {
		return "updemo/upform";
	}

	@PostMapping(value = "/uploadpro")
	public String uploadFile(Model m, UpBoardDTO dto, HttpServletRequest request) {
		// System.out.println("sub :"+dto.getSub());

		String img_path = "resources\\imgfile";

		// request를 가지고 이미지의 경로를 받아서 출력
		String r_path = request.getRealPath("/");
		System.out.println("r_path:" + r_path);
		// 업로드 된 이미지의 이름을 받아서 이미지를 복사
		// 이미지 이름 확인
		String oriFn = dto.getMfile().getOriginalFilename();

		System.out.println("oriFn:" + oriFn);

		// 이미지 사이즈 및 contentType 확인
		long size = dto.getMfile().getSize();
		String contentType = dto.getMfile().getContentType();
		// contentType의 종류
		// application/vnd.ms-excel
		// application/pdf
		// text/plain
		// application/haansofthwp
		// image/jpeg
		System.out.println("파일 크기 :" + size);
		System.out.println("파일의 type :" + contentType);

		// 메모리상(임시저장장소)에 파일을 우리가 설정한 경로에 복사 하겠다.
		// 이미지가 저장될 경로 만들기
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath :" + path);

		// 추상경로 (이미지를 저장할 경로) File 객체로 생성
		File f = new File(path.toString());

		// 임시 메모리에 담긴 즉 업로드한 파일의 값 -> File클래스의 경로로 복사
		try {
			dto.getMfile().transferTo(f);
			// 이미지 이름을 db에 저장하기 위해서 DTO 값을 재설정
			dto.setImgn(oriFn);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		upBoardList.addUpBoard(dto);

		return "redirect:upboardList"; // 리스트로 이동 시킬 예정
	}

	// search일경우 post올수 있으니 method를 설정 않음
	@RequestMapping("/upboardList")
	public String upBoardList(Model model, String cPage,String searchType,String searchValue) {
		// Map<String, Integer> map = new HashMap<String, Integer>();
		// map.put("begin", 1);
		// map.put("end", 10);
		// List<UpBoardDTO> list = upBoardList.getList(map);

		// --------------Page 처리하기
		// 총 게시물 수 가져오기 => 실행결과 TotalRecord :21
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
		return "updemo/upboardList";
	}
}
