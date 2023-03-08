package kr.co.kosmo.mvc.controller.chart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
//2023-01-18  1교시
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

//@Controller -> 스프링 컨테이너가 Model로 선택해서
//현재 시스템에서는 InternalResourceViewResolver를 통해서 지정한
//View로 forward 방식으로 이동한다.
// @RestController -> CustomView를 사용해서 지정한 View 즉,
// JSP를 사용하지 않고 데이터를 응답할 수 있기 때문에
// 주로 JSON으로 response 할 때 주로 사용함

// @RestController란? : json 과 같은 데이터를 서비스 하기 위한 컨트롤러다.

@RestController
//@Controller : 파일 [/WEB-INF/views/안녕하세요.jsp]을(를) 찾을 수 없습니다.
public class ChartRestController {
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	//해당 요청이 오면 가상 View에다가 반환받은 값을 전달 해서 응답 처리를 해준다
	//produces = "text/html;charset=euc-kr"  => Content-Type을 지정하는 속성  -> 값만 처리
	@RequestMapping(value = "/helloView",produces = "text/html;charset=euc-kr")
	public String viewMessage() {
		return "안녕하세요";
	}
	
	//Json Object Type -> javascript Object
	@RequestMapping(value = "/deptJsonView1",produces = "application/json;charset=utf-8")
	public MemberDTO jsonObjectDemo1(String id) {

		try {
			System.out.println("ID => "+id);
			MemberDTO vo = memberDaoInter.jsonDemo(id);
			return vo;
		} catch (Exception e) {
			MemberDTO vo = memberDaoInter.jsonDemo(id);
			vo.setName("없음");
			return vo;
		}
		//테스트용 VO에 적절한 값 저장
		/*
		MemberDTO vo = new MemberDTO();
		vo.setName("김길동");
		vo.setNum(1);
		vo.setAge(21);
		vo.setGender("남");
		vo.setId("gildong");
		vo.setPwd("11");
		vo.setMdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		*/
		//euc - kr로 하면 글씨가 꺠진다.
		
		//결과 확인  utf-8
		//{"num":1,"age":21,"id":"gildong","pwd":"11",
		//"name":"김길동","gender":"남","mdate":"2023-01-18"}
	}
	//연습문제 ) 회원 전체를 출력하는 JsonView를 만드시오.
	@RequestMapping(value = "/memberJsonList",produces = "application/json;charset=utf-8")
	public List<MemberDTO> listJson() {
		List<MemberDTO> list = memberDaoInter.jsonList();
		
		return list;
	}
	
	
}
