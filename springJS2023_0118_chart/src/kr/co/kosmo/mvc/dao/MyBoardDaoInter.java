package kr.co.kosmo.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.kosmo.mvc.vo.BoardVO;

public interface MyBoardDaoInter {
	public void addBoard(BoardVO vo);
	public List<BoardVO> listBoard();
	public BoardVO detailBoard(int num);
	public void delBoard(int num);
}
