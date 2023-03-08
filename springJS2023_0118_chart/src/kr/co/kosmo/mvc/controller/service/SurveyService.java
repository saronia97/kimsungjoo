package kr.co.kosmo.mvc.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kosmo.mvc.dao.SurveyDao;
import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

//<context:component-scan base-package="kr.co.kosmo.mvc"/>
//@Service,@Repository,@Component, @Configuration, @Controller,
//@RestController, @ControllerAdvice
//비지니스 로직을 담당 할 수 있다.
@Service
public class SurveyService {
	//Dao를 단위 처리 하기 위한 서비스
	@Autowired
	private SurveyDao surveyDao;
	//모델에서 받아온 각 데이터를 Dao에 각각 전달 해서 단위 처리를 하기 위한 메서드
	
	//@Transactional 처리를 하기 위해서
	//공통빈에서 설정 <tx:annotation-driven> ,DataSourceTransactionManager  DI
	@Transactional
	public void addSurvey(SurveyVO vo, List<SurveyContentVO> list) {
		//단위처리 적용
		surveyDao.addSurvey(vo); //commit X
		surveyDao.addSurveyContent(list); //commit X
		//commit
	}
	
	public SurveyVO adminDetail(int num) {
		return surveyDao.adminDetail(num);
	}
	
	public void updateSurveyCnt(SurveyContentVO scvo) {
		surveyDao.updateSurveyCnt(scvo);
	}
	public List<SurveyVO> listSurvey() {
		return surveyDao.listSurvey();
	}
}
