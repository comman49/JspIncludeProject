<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*,java.io.*"%>
<%
String fn = request.getParameter("fn");
String path = "c:\\download";

//header -> 실제 데이터 전송 전에 보내야할 데이터
File f = new File(path + "\\" + fn);
response.setContentLength((int)f.length());
response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fn, "utf-8"));

try {
	// 서버에 존재하는 파일
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
	// 요청한 클라이언트로 전송	
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	int i = 0;
	byte[] buffer = new byte[1024];
	
	while((i = bis.read(buffer, 0, 1024)) != -1) {
		bos.write(buffer, 0, i);
	}
	// out을 초기화해야한다?
	out.clear(); // 파일 쓰기 종료
	out = pageContext.pushBody(); // 원래 상태로 변경
 	bis.close();
	bos.close();
} catch(Exception e) {
	System.out.println(e.getMessage());
}
%>