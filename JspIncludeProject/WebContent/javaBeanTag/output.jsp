<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import='com.sist.member.*'%>
<%-- <%
request.setCharacterEncoding("euc-kr");
MemberVO vo = new MemberVO();
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String age = request.getParameter("age");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

vo.setName(name);
vo.setSex(sex);
vo.setAddr(addr);
vo.setTel(tel);
vo.setAge(Integer.parseInt(age));
%> --%>
<%
request.setCharacterEncoding("euc-kr");
%>
<!-- useBean이 객체 생성을 해준다. -->
<jsp:useBean id="vo" class='com.sist.member.MemberVO'>
	<!-- setProperty는 리퀘스트에 있는 모든 정보를 가져다가 넣어준다.
	단, request에 있는 name과 변수명이 동일해야한다. -->
	<jsp:setProperty name='vo' property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>전송 받은 값</h3>
	이름 : <%=vo.getName() %><br>
	성별 : <%=vo.getSex() %><br>
	나이 : <%=vo.getAge() %><br>
	주소 : <%=vo.getAddr() %><br>
	전화 : <%=vo.getTel() %><br>
</body>
</html>