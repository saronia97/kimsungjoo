package kr.co.kosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;

public interface MemberDaoInter {
	// 응집도를 낮추기 위해서 interface를 사용
	public void addMember(MemberDTO dto);

	public int idcheck(String id);
	
	//아이디와 비번을 vo로 전송하고 반환값으로 id,name등을 반환
	public MemberDTO loginCheck(MemberDTO vo);
	//Aop에 사용될 
	public void addLoginLogging(MyLoginLoggerDTO vo);

	public int login(MemberDTO dto);

	public List<MemberDTO> listMember(Map<String, Integer> map);

	public int getCnt();
	
	public MemberDTO detailmember(int num);
	
	public MemberDTO jsonDemo(String id);
	
	public List<MemberDTO> jsonList();
}
