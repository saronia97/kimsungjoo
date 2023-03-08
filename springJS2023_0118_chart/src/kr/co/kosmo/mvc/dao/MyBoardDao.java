package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.BoardVO;

@Repository
public class MyBoardDao implements MyBoardDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addBoard(BoardVO vo) {
		ss.insert("myboard.add",vo);
	}

	@Override
	public List<BoardVO> listBoard() {
		return ss.selectList("myboard.list");
	}

	@Override
	public BoardVO detailBoard(int num) {
		return ss.selectOne("myboard.detail", num);
	}

	@Override
	public void delBoard(int num) {
		ss.delete("myboard.delete", num);
	}

}
