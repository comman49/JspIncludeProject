<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
	String mode = request.getParameter("mode");
	int no = Integer.parseInt(mode);
	
	if (no == 1) {
		// sendRedirect
		response.sendRedirect("result.jsp");
		// output.jsp�� �޸𸮿��� �����ǰ� request�� �ʱ�ȭ
	} else if (no == 2) {
		//forward
		//pageContext.forward("result.jsp");
		
		/*
		pageContext
		 -> include : <jsp:include> �̷��Ե� ����� �� �ִ�.
		 -> forward : <jsp:forward>
		 �� �ΰ��� �����ִ�.
		*/
%>
		<jsp:forward page="result.jsp"/>
<%
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>