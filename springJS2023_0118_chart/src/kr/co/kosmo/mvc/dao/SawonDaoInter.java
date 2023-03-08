package kr.co.kosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.kosmo.mvc.vo.DeptVO;
import kr.co.kosmo.mvc.vo.SawonVO;

public interface SawonDaoInter {

	//deptlist -> getDeptList
	public DeptVO getDeptList(int num);
	//sawonPhone -> getSawonPhoneList
	public List<SawonVO> getSawonPhoneList(); 
	
	//procedure
	public List<HashMap> procedureList(int num);
	public void procedureAdd(SawonVO vo);
}
