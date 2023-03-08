<�⺻ MVC ȯ�� ���� �� ���۰� ���� �������>

1. spring������Ʈ �����

2. maven ���� pom.xml

3. web.xml �������� ���� filter,servletó��

   ���� : filter �� ���� �� , ��� ��û -> �ϳ���  servlet ��Ʈ���δ�[DispatcherServlet].(����-> ī��, ��Ʈ �ڼ��� ���� ����)
	MVC���� Controller�� �ش�ȴ�. ������ �����̳ʸ� �����ϰ� �����Ѵ�.(init())

4. kosmo-web.xml -> �����������̳� ���� �ϴ� ����� ��� 
context:component-scan ����ؼ� @Controller,@ControlAdvice,@Service ...... ���
@Autowried , @rResource ��� ����


�ʹ��ڵ�) = �⺻ ���̽� �ڵ�

<aop:aspectj-autoproxy/>

<context:component-scan base-package="kr.co.kosmo.mvc"/>

<mvc:annotation-driven/>

<mvc:resources location="/resources/" mapping="/resources/**"/>


<bean id="viewResolver" 

class="org.springframework.web.servlet.view.InternalResourceViewResolver">  

InternalResourceViewResolver�� view�� �����ϰ� ���ش�

<property name="prefix" value="/WEB-INF/views/"/>

<property name="suffix" value=".jsp"/>

</bean>


   ���� : DI����� �Ǵ� ��ü ��� 

          MVC ��Ű��ó�� ���� ->(����-> ī��, ��Ʈ �ڼ��� ���� ����)

<context:annotation-config �̰��� ����ϴ� ������̼� ������ ��

              <context:component-scan

          @Controller, @ Aspect , @Autowired , @Resource ���  


          DataSource , MyBatis, InternalResourceViewResolver(jsp)��� 


5. Controller Ŭ������ �����.

// ��Ű���� �ݵ�� ���� ���ƾ� �ϳ�? 

package kr.co.kosmo.mvc.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

// @Controller -> DispatcherServlet ��û�ϱ� ���� �𵨷� ��� 

@Controller

public class DefaultController {

// HandlerMapping : ��û�� �м��ϰ� �ش� ���� ����

@RequestMapping(value= {"/","/main"})

public String defaultIndex() {

[ view�� ������ ������ ���ڰ��� model�� �־� ����.

return "main/index"; // ModelAndView 

}

}


6. View������ �����

/WEB-INF/views/main/index.jsp�� �����Ѵ�.

����

<bean id="viewResolver" 

class="org.springframework.web.servlet.view.InternalResourceViewResolver">

<property name="prefix" value="/WEB-INF/views/"/>
<property name="suffix" value=".jsp"/>

</bean>

5������ ���� ���� �ǰ� �� �� main/index �� InternalResourceViewResolver ���� �����ְ� �ְ� �ٽ� �����ؼ� Response �Ѵ�. 



7. �ϴ� ���⼭ �׽�Ʈ �ؾ� �Ѵ�.~ ����!


<�������� MyBatis����>

���� �н� : myBatis ��Ű��ó ���� 

8. ojdbc.jar�� ��Ĺ�� ���̺귯���� ��� �Ǿ����� Ȯ��(�ʼ�)

9. context.xml

���� : 

JDBC : InitialContext ��ü�� ����ؼ� lookup �޼��带 ���ؼ� jndi������� DataSource ��ü�� Connection ��ȯ 

myBatis : <dataSource type="JNDI">

  <property name="data_source" value="java:comp/env/jdbc/myora"/>

  </dataSource>

spring : JndiObjectFactoryBean -> jndi�������  DataSource�� ������ �ޱ����� ��ü 

10. kosmo-web.xml�� DataSource�� MyBatis-spring ������ ����Ѵ�.

 MyBatis  SqlSessionFactoryBean���� ���� ����

11. ����� ���̺��� �ۼ� ( SQL )

<���� : SqlSessionFactoryBean �� ����� ��ġ�� ���� ��ξ� �Ѵ�> 

12. ���̺� �°� DTO ����� config.xml�� �ۼ��ϰ� �ű⼭ DTO��  typealias ���� 

13. mapper.xml ���� SQL���� �ۼ� 

14. Dao�� ���� 

 - @Repository,  SqlSessionTemplate ss ���� @Autowired ; �ʼ�

 ���� ) @Repository ���⼭ �ۼ� �غ��� 
	@Autowired
	private Sqlsession ss
    ss�� mybatis�� SqlSession ��ü�� �ش� , commit, close()   (x) �����ʰ� �ڵ� ó���� ���� ���ش�

<����>

  - insert("namespace.id",paramval);

   - mapper.xml���� ����� �� )

   XXmapper.xml => 

    <mapper namespace="member">

    <insert id="add" parameterType="mvo"> 

    ***** mvo�� config.xml���� ����ߴ� Typealias  

   Dao =>  

     public void insertAdd(MemberVO vo){

      ss.insert("member.add", vo);

   }

    insert(),delete(),update(),selectOne(),selectList()

15. Model 

 - * �⺻���� ����  form�� name , dto�� property , database column �� �̸��� ���ƾ� �Ѵ�.

 - �䱸���׿� ���� �۾� ������ �Ǵ��ؾ� �Ѵ�.

 �� -> ���� ����ϴ� ��Ʈ���� 

  ���� ) 

<form method="post" action="handlermapping�� �̸� " >

<input type="text"  [name="vo��property"]  [id ="name�� ����" => js �ڵ鸵]

<input type="submit">

</form>

  DB�� �Է� ó�� ��Ʈ����

@Autowired

private DaoInter daointer; ������ �ڵ� ����

   @PostMapping("action���� ������ handlermapping�� �̸�")

public String addin(VO vo){

daointer.addMember(vo);

return "redirect:������ ";

}

16. ������ �Է��� �����ͺ��̽����� Ȯ�� ~ ���� 

17. ���� ���ε� ����!

dto->config.xml  dto alias -> dao, MyBatis mapper�۾� ,

-> model ���� Dao�� ����  ->

X  -> form ���� -> Model  

*  ���Ͼ��ε� ó���� ���ؼ� �ʼ� ����

1) pom.xml ���� �ʼ� ��� 

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

2)  kosmo-web.xml���� 

CommonsMultipartResolver �� ��� 

<bean id="multipartResolver" 

class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>

3) UpBoardDTO 

private MultipartFile mfile; ����ϰ� sett/gett

4) form���� ����  enctype="multipart/form-data" �� ���� ���۹���� �ݵ�� post !!!!!!!

<input type="file" name="upfile" id="upfile"/> upfile�� ���̳ʸ� �����̰� �������� ���縦 �ؼ� �ش� ������ �Űܿ��鼭

������ �̸��� �����ͺ��̽��� ���� 

form name : mfile --> MultipartFile mfile -> �𵨿��� file�� �̸��� ���ͼ� private String imgn�� �̸��� ���� 

5) 

���� ���ε带 ��Ʈ�������� ó�� �ϱ� ���� �ٽ� ����

�ݵ�� ���۹���� POST���� �Ѵ�. 

<form action="XX">         

  ============>  

// ���� ���ε� ó�� - 

//[                     ]

public String uploadFile(Model m, UpBoardDTO dto,

HttpServletRequest request) {

return "";

}