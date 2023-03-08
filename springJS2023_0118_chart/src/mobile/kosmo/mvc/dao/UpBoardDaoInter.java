package mobile.kosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.kosmo.mvc.vo.UpBoardDTO;

public interface UpBoardDaoInter {
	public void addUpBoard(UpBoardDTO vo);

	public int getCnt();

	public List<UpBoardDTO> getList(Map<String, Integer> map);

	public UpBoardDTO getDetail(int num);

	public void upUpBoard(UpBoardDTO vo);

	public void upDelete(int num);
}