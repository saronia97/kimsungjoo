package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

@Repository
public class SurveyDao {
	@Autowired
	private SqlSessionTemplate ss;

		public void addSurvey(SurveyVO vo) {
			ss.insert("survey.add",vo);
		}
		public void addSurveyContent(List<SurveyContentVO> list) {
			ss.insert("survey.addcontent",list);
		}
		public SurveyVO adminDetail(int num) {
			SurveyVO vo = ss.selectOne("survey.adminDetail",num);
			List<SurveyContentVO> list = vo.getSubvey();
			System.out.println("SurveyContentVO Size : " + list.size());
			return vo;
		}
		public void updateSurveyCnt(SurveyContentVO scvo) {
			ss.update("survey.updateSurveyCnt",scvo);
		}
		//list 구현하기
		public List<SurveyVO> listSurvey() {
			return ss.selectList("survey.listSurvey");
		}
}
