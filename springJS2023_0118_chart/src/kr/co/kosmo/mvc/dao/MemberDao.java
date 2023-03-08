package kr.co.kosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;

// Dao���� @Repository ��� -> Dao�� ������ ��Ͻ����ش�
// �⺻���� �̱������� �����ȴ�
@Repository
public class MemberDao implements MemberDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	// kosmo-web.xml���� byname�ϱ� ���ؼ� SqlSessionTemplate bean�� id�� ss�� ������!
	
	// SqlSession ss = SqlSessionFactory.getFactory().openSesseion(); ��� ���ִ� ������
	// <bean id="ss" class="ord.mybatis.spring.SqlSessionTemplate">
	// ���� ����ϱ� ���ؼ��� DI�� ���� �޾ƾ� �ϹǷ�, ��� ���� ���� �� @Autowired  !
	
	@Override
	public void addMember(MemberDTO dto) {
		ss.insert("member.add", dto);
		// ss.commit();
		// ss.close(); ���ص� �ȴ�!!!!!!!!!!
	}

	@Override
	public int idcheck(String id) {
		return ss.selectOne("member.idchk", id);
	}

	@Override
	public int login(MemberDTO dto) {
		return ss.selectOne("member.login",dto);
	}

	@Override
	public List<MemberDTO> listMember(Map<String, Integer> map) {
		return ss.selectList("member.listpage",map);
	}

	@Override
	public int getCnt() {
		return ss.selectOne("member.totalCount");
	}

	@Override
	public MemberDTO detailmember(int num) {
		return ss.selectOne("member.detail",num);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO vo) {
		
		return ss.selectOne("member.login",vo);
	}

	@Override
	public void addLoginLogging(MyLoginLoggerDTO vo) {
		ss.insert("member.logger_in",vo);
	}
	
	@Override
	public MemberDTO jsonDemo(String id){
		return ss.selectOne("member.jsonDemo",id);
	}

	@Override
	public List<MemberDTO> jsonList() {
		return ss.selectList("member.jsonList");
	}

}
