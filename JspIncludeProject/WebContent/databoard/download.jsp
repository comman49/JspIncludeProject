<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*,java.io.*"%>
<%
String fn = request.getParameter("fn");
String path = "c:\\download";

//header -> ���� ������ ���� ���� �������� ������
File f = new File(path + "\\" + fn);
response.setContentLength((int)f.length());
response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fn, "utf-8"));

try {
	// ������ �����ϴ� ����
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
	// ��û�� Ŭ���̾�Ʈ�� ����	
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	int i = 0;
	byte[] buffer = new byte[1024];
	
	while((i = bis.read(buffer, 0, 1024)) != -1) {
		bos.write(buffer, 0, i);
	}
	// out�� �ʱ�ȭ�ؾ��Ѵ�?
	out.clear(); // ���� ���� ����
	out = pageContext.pushBody(); // ���� ���·� ����
 	bis.close();
	bos.close();
} catch(Exception e) {
	System.out.println(e.getMessage());
}
%>