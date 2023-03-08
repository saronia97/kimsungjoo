<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../temp/header.jsp"%>
<article>
    <header>
        <h1>�α��� Demo</h1>
    </header>
    <ul class="list-unstyled">
        <li class="border-top my-3"></li>
    </ul>
    <div class="container">
        <%--memberForm ��� �� �ڸ�. --%>
        <form action="login" method="post">
            <%-- ������� �����Ǹ� �޾ƿͼ� ������ �ʴ� �Ӽ����� reip �� �Ķ���ͷ� �����Ѵ�. --%>
            <div class="form-group">
                <label for="id">���̵� </label>
                <input type="text" class="form-control" id="id" name="id" placeholder="���̵� �Է� (5-10)" required="required" pattern=".{5,10}">
            </div>
            <div class="form-group">
                <label for="pwd">��й�ȣ</label>
                <input type="password" class="form-control" id="pwd" name="pwd" required="required">
            </div>
            <div class="form-group" style="text-align: right; margin-top: 10px;">
                <button type="submit" class="btn btn-primary">���</button>
            </div>
        </form>
    </div>
</article>
<%@include file="../temp/footer.jsp"%>