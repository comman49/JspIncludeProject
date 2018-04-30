package com.sist.databoard.dao;

/*
 * 일반 자바 클래스를 자바 빈이라고 한다.
 * 1. 데이터 빈 : 데이터만 관리 (읽기, 쓰기)
 *    읽기 : get~()
 *    쓰기 : set~()
 *    상태 : is~() : 존재하는지 확인할 때 사용, 반환형은 boolean
 * 2. 액션 빈 : 빈을 활용하는 클래스 (기능수행 -> 메소드)
 *    dao
 *    manager
 *    service
 * 3. 혼합빈 : 데이터 빈 + 액션 빈
 * 
 * 4. 자바에 대응하는 자바 빈의 태그
 *    1) 메모리 할당 : <jsp:useBean>
 *    2) get~() 메소드 호출 : <jsp:setProperty>
 *    3) set~() 메소드 호출 : <jsp:getProperty>
 *    <c:forEach>
 *    <c:if>
 *    <c:choose>
 */
import java.util.*;

public class DataBoardVO {
	private int no;
	private String name;
	private String subject;
	private String content;
	private String pwd;
	private Date regdate;
	private int hit;
	private String filename;
	private int filesize;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date date) {
		this.regdate = date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
}
