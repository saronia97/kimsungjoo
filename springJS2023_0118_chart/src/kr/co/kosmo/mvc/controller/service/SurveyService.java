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
//�����Ͻ� ������ ��� �� �� �ִ�.
@Service
public class SurveyService {
	//Dao�� ���� ó�� �ϱ� ���� ����
	@Autowired
	private SurveyDao surveyDao;
	//�𵨿��� �޾ƿ� �� �����͸� Dao�� ���� ���� �ؼ� ���� ó���� �ϱ� ���� �޼���
	
	//@Transactional ó���� �ϱ� ���ؼ�
	//����󿡼� ���� <tx:annotation-driven> ,DataSourceTransactionManager  DI
	@Transactional
	public void addSurvey(SurveyVO vo, List<SurveyContentVO> list) {
		//����ó�� ����
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
