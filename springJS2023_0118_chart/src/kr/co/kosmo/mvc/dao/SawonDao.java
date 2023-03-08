package kr.co.kosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.DeptVO;
import kr.co.kosmo.mvc.vo.SawonVO;
@Repository
public class SawonDao implements SawonDaoInter{
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public DeptVO getDeptList(int num) {
		return ss.selectOne("ksawon.deptList",num);
	}

	@Override
	public List<SawonVO> getSawonPhoneList() {
		return ss.selectList("ksawon.sawonlist");
	}

	@Override
	public List<HashMap> procedureList(int num) {
		HashMap map = new HashMap();
		//map 에 in 모드로 전달할 값을 저장
		map.put("deptno", num);
		ss.selectList("ksawon.procedure1",map);
		//#{result, mode=OUT , 커서의 값을 맵에 저장해준다.
		//키값으로 찾아서 출력해본다.
		System.out.println(map.get("result")); //반드시 찍어서 확인해본다.
		//map.get("result")
		return (List<HashMap>) map.get("result");
	}

	@Override
	public void procedureAdd(SawonVO vo) {
		ss.insert("ksawon.procedure2",vo);
	}

}
