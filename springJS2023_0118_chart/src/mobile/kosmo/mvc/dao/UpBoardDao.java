package mobile.kosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.UpBoardDTO;

//upBoardDao -> byName, alias 설정으로 byName 하기
@Repository("upBoardList")
public class UpBoardDao implements UpBoardDaoInter{
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public void addUpBoard(UpBoardDTO vo) {
		ss.insert("upboard.add",vo);
	}

	@Override
	public int getCnt() {
		return ss.selectOne("upboard.totalCount");
	}

	@Override
	public List<UpBoardDTO> getList(Map<String, Integer> map) {
		
		return ss.selectList("upboard.listpage",map);
	}

	@Override
	public UpBoardDTO getDetail(int num) {

		return ss.selectOne("upboard.detail",num);
	}

	@Override
	public void upUpBoard(UpBoardDTO vo) {
		//ss.update("upboard.update",vo)
	}

	@Override
	public void upDelete(int num) {
		//ss.up
	}

}
