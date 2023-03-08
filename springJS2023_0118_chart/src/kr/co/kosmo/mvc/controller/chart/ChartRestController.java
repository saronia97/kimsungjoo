package kr.co.kosmo.mvc.controller.chart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
//2023-01-18  1����
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

//@Controller -> ������ �����̳ʰ� Model�� �����ؼ�
//���� �ý��ۿ����� InternalResourceViewResolver�� ���ؼ� ������
//View�� forward ������� �̵��Ѵ�.
// @RestController -> CustomView�� ����ؼ� ������ View ��,
// JSP�� ������� �ʰ� �����͸� ������ �� �ֱ� ������
// �ַ� JSON���� response �� �� �ַ� �����

// @RestController��? : json �� ���� �����͸� ���� �ϱ� ���� ��Ʈ�ѷ���.

@RestController
//@Controller : ���� [/WEB-INF/views/�ȳ��ϼ���.jsp]��(��) ã�� �� �����ϴ�.
public class ChartRestController {
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	//�ش� ��û�� ���� ���� View���ٰ� ��ȯ���� ���� ���� �ؼ� ���� ó���� ���ش�
	//produces = "text/html;charset=euc-kr"  => Content-Type�� �����ϴ� �Ӽ�  -> ���� ó��
	@RequestMapping(value = "/helloView",produces = "text/html;charset=euc-kr")
	public String viewMessage() {
		return "�ȳ��ϼ���";
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
			vo.setName("����");
			return vo;
		}
		//�׽�Ʈ�� VO�� ������ �� ����
		/*
		MemberDTO vo = new MemberDTO();
		vo.setName("��浿");
		vo.setNum(1);
		vo.setAge(21);
		vo.setGender("��");
		vo.setId("gildong");
		vo.setPwd("11");
		vo.setMdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		*/
		//euc - kr�� �ϸ� �۾��� ������.
		
		//��� Ȯ��  utf-8
		//{"num":1,"age":21,"id":"gildong","pwd":"11",
		//"name":"��浿","gender":"��","mdate":"2023-01-18"}
	}
	//�������� ) ȸ�� ��ü�� ����ϴ� JsonView�� ����ÿ�.
	@RequestMapping(value = "/memberJsonList",produces = "application/json;charset=utf-8")
	public List<MemberDTO> listJson() {
		List<MemberDTO> list = memberDaoInter.jsonList();
		
		return list;
	}
	
	
}
