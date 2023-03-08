package kr.co.kosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;

public interface MemberDaoInter {
	// �������� ���߱� ���ؼ� interface�� ���
	public void addMember(MemberDTO dto);

	public int idcheck(String id);
	
	//���̵�� ����� vo�� �����ϰ� ��ȯ������ id,name���� ��ȯ
	public MemberDTO loginCheck(MemberDTO vo);
	//Aop�� ���� 
	public void addLoginLogging(MyLoginLoggerDTO vo);

	public int login(MemberDTO dto);

	public List<MemberDTO> listMember(Map<String, Integer> map);

	public int getCnt();
	
	public MemberDTO detailmember(int num);
	
	public MemberDTO jsonDemo(String id);
	
	public List<MemberDTO> jsonList();
}
