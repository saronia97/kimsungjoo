<기본 MVC 환경 설정 및 제작과 개념 요약정리>

1. spring프로젝트 만들기

2. maven 에서 pom.xml

3. web.xml 스프링에 관련 filter,servlet처리

   개념 : filter 는 서블릿 전 , 모든 요청 -> 하나의  servlet 컨트럴로다[DispatcherServlet].(정리-> 카페, 노트 자세한 정리 참조)
	MVC에서 Controller에 해당된다. 스프링 컨테이너를 생성하고 관리한다.(init())

4. kosmo-web.xml -> 스프링컨테이너 참고 하는 빈들의 목록 
context:component-scan 사용해서 @Controller,@ControlAdvice,@Service ...... 사용
@Autowried , @rResource 등등 지원


초반코드) = 기본 베이스 코드

<aop:aspectj-autoproxy/>

<context:component-scan base-package="kr.co.kosmo.mvc"/>

<mvc:annotation-driven/>

<mvc:resources location="/resources/" mapping="/resources/**"/>


<bean id="viewResolver" 

class="org.springframework.web.servlet.view.InternalResourceViewResolver">  

InternalResourceViewResolver가 view를 선택하게 해준다

<property name="prefix" value="/WEB-INF/views/"/>

<property name="suffix" value=".jsp"/>

</bean>


   개념 : DI대상이 되는 객체 취급 

          MVC 아키텍처를 참조 ->(정리-> 카페, 노트 자세한 정리 참조)

<context:annotation-config 이것이 허용하는 어노테이션 복습할 것

              <context:component-scan

          @Controller, @ Aspect , @Autowired , @Resource 등등  


          DataSource , MyBatis, InternalResourceViewResolver(jsp)등등 


5. Controller 클래스를 만든다.

// 패키지는 반드시 어디와 같아야 하나? 

package kr.co.kosmo.mvc.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

// @Controller -> DispatcherServlet 요청하기 위한 모델로 등록 

@Controller

public class DefaultController {

// HandlerMapping : 요청을 분석하고 해당 모델을 실행

@RequestMapping(value= {"/","/main"})

public String defaultIndex() {

[ view로 보내고 싶으면 인자값에 model을 넣어 쓴다.

return "main/index"; // ModelAndView 

}

}


6. View페이지 만들기

/WEB-INF/views/main/index.jsp를 제작한다.

개념

<bean id="viewResolver" 

class="org.springframework.web.servlet.view.InternalResourceViewResolver">

<property name="prefix" value="/WEB-INF/views/"/>
<property name="suffix" value=".jsp"/>

</bean>

5번에서 모델이 수행 되고 난 후 main/index 를 InternalResourceViewResolver 에게 돌려주고 애가 다시 조립해서 Response 한다. 



7. 일단 여기서 테스트 해야 한다.~ 성공!


<스프링과 MyBatis연동>

선수 학습 : myBatis 아키텍처 설명 

8. ojdbc.jar가 톰캣에 라이브러리도 등록 되었는지 확인(필수)

9. context.xml

개념 : 

JDBC : InitialContext 객체를 사용해서 lookup 메서드를 통해서 jndi방식으로 DataSource 객체로 Connection 반환 

myBatis : <dataSource type="JNDI">

  <property name="data_source" value="java:comp/env/jdbc/myora"/>

  </dataSource>

spring : JndiObjectFactoryBean -> jndi방식으로  DataSource를 빈으로 받기위한 객체 

10. kosmo-web.xml에 DataSource와 MyBatis-spring 설정을 등록한다.

 MyBatis  SqlSessionFactoryBean에서 설정 참고

11. 설계된 테이블을 작성 ( SQL )

<주의 : SqlSessionFactoryBean 에 등록한 위치와 같은 경로야 한다> 

12. 테이블에 맞게 DTO 만들고 config.xml을 작성하고 거기서 DTO의  typealias 정의 

13. mapper.xml 만들어서 SQL문을 작성 

14. Dao를 정의 

 - @Repository,  SqlSessionTemplate ss 으로 @Autowired ; 필수

 개념 ) @Repository 여기서 작성 해보기 
	@Autowired
	private Sqlsession ss
    ss는 mybatis의 SqlSession 객체에 해당 , commit, close()   (x) 하지않고 자동 처리를 제공 해준다

<사용법>

  - insert("namespace.id",paramval);

   - mapper.xml에서 등록한 예 )

   XXmapper.xml => 

    <mapper namespace="member">

    <insert id="add" parameterType="mvo"> 

    ***** mvo는 config.xml에서 등록했던 Typealias  

   Dao =>  

     public void insertAdd(MemberVO vo){

      ss.insert("member.add", vo);

   }

    insert(),delete(),update(),selectOne(),selectList()

15. Model 

 - * 기본사항 복습  form의 name , dto의 property , database column 은 이름이 같아야 한다.

 - 요구사항에 따라서 작업 유형을 판단해야 한다.

 폼 -> 폼을 출력하는 컨트럴러 

  구성 ) 

<form method="post" action="handlermapping의 이름 " >

<input type="text"  [name="vo의property"]  [id ="name과 같음" => js 핸들링]

<input type="submit">

</form>

  DB에 입력 처리 컨트럴러

@Autowired

private DaoInter daointer; 의존성 자동 주입

   @PostMapping("action에서 정의한 handlermapping의 이름")

public String addin(VO vo){

daointer.addMember(vo);

return "redirect:보낼곳 ";

}

16. 폼에서 입력후 데이터베이스에서 확인 ~ 성공 

17. 파일 업로드 진행!

dto->config.xml  dto alias -> dao, MyBatis mapper작업 ,

-> model 에서 Dao를 연결  ->

X  -> form 제작 -> Model  

*  파일업로드 처리를 위해서 필수 조건

1) pom.xml 에서 필수 등록 

commons-io

commons-fileupload

<!--  Fileupload --> 

<dependency>

<groupId>commons-io</groupId>

<artifactId>commons-io</artifactId>

<version>2.6</version>

</dependency>

<!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->

<dependency>

<groupId>commons-fileupload</groupId>

<artifactId>commons-fileupload</artifactId>

<version>1.4</version>

</dependency>

2)  kosmo-web.xml에서 

CommonsMultipartResolver 를 등록 

<bean id="multipartResolver" 

class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>

3) UpBoardDTO 

private MultipartFile mfile; 등록하고 sett/gett

4) form에서 지정  enctype="multipart/form-data" 이 폼의 전송방식은 반드시 post !!!!!!!

<input type="file" name="upfile" id="upfile"/> upfile은 바이너리 파일이고 이파일을 복사를 해서 해당 폴더로 옮겨오면서

파일의 이름을 데이터베이스에 저장 

form name : mfile --> MultipartFile mfile -> 모델에서 file의 이름을 얻어와서 private String imgn에 이름만 저장 

5) 

파일 업로드를 컨트럴러에서 처리 하기 위한 핵심 개념

반드시 전송방식은 POST여야 한다. 

<form action="XX">         

  ============>  

// 파일 업로드 처리 - 

//[                     ]

public String uploadFile(Model m, UpBoardDTO dto,

HttpServletRequest request) {

return "";

}