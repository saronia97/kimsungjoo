<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../temp/header.jsp"%>
<article>
    <header>
        <h1>로그인 Demo</h1>
    </header>
    <ul class="list-unstyled">
        <li class="border-top my-3"></li>
    </ul>
    <div class="container">
        <%--memberForm 들어 갈 자리. --%>
        <form action="login" method="post">
            <%-- 사용자의 아이피를 받아와서 보이지 않는 속성으로 reip 란 파라미터로 지정한다. --%>
            <div class="form-group">
                <label for="id">아이디 </label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력 (5-10)" required="required" pattern=".{5,10}">
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" class="form-control" id="pwd" name="pwd" required="required">
            </div>
            <div class="form-group" style="text-align: right; margin-top: 10px;">
                <button type="submit" class="btn btn-primary">등록</button>
            </div>
        </form>
    </div>
</article>
<%@include file="../temp/footer.jsp"%>