<%@page import="com.sist.databoard.dao.DataBoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.*"%>
<%@page import="com.sist.databoard.dao.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class='com.sist.databoard.dao.DataBoardDAO'></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String path = "c:\\download";
	int size = 1024 * 1024 * 100;
	String enctype = "EUC-KR";
	MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

	response.sendRedirect("../main/main.jsp?mode=4");

	// ������ �ޱ�
	String name = mr.getParameter("name");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String pwd = mr.getParameter("pwd");
	String filename = mr.getOriginalFileName("upload");

	DataBoardVO vo = new DataBoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);

	//���ε尡 ���� ���
	if (filename == null) {
		vo.setFilename("");
		vo.setFilesize(0);
	}
	//���ε� �� ����
	else {
		vo.setFilename(filename);
		File f = new File(path + "\\" + filename);
		vo.setFilesize((int) f.length());
	}

	//DB����
	dao.databoardInsert(vo);
	response.sendRedirect("../main/main.jsp?mode=4");
%>