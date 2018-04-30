package com.sist.foodhouse.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;

	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void getConnection() {
		try {
			// 저장된 위치 -> 주소값 읽기 -> 이름으로 디렉토리를 만든 것 (JNDI)
			Context init = new InitialContext(); // 탐색기라고 생각할 것?
			Context c = (Context) init.lookup("java://comp/env"); // 이 안에 주소값이 저장되어 있다는 뜻.
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");

			conn = ds.getConnection();
			// String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			// conn = DriverManager.getConnection(url, "scott", "1234");
		} catch (Exception e) {
			System.out.println("getConnection : " + e.getMessage());
		}
	}

	public void disconnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 카테고리 저장
	public void foodCategoryInsert(CategoryVO vo) {
		try {
			getConnection();
			// if(a==null) a="1"
			String sql = "INSERT INTO category VALUES((SELECT NVL(MAX(cateno)+1,1) FROM category),?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getSubject().replace("\"", ""));
			ps.setString(3, vo.getPoster());
			ps.executeUpdate();
		} catch (Exception ex) {
			System.out.println("foodCategoryInsert : " + ex.getMessage());
		} finally {
			disconnection();
		}
	}

	public ArrayList<CategoryVO> catagoryAllData() {
		ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();

		try {
			getConnection();
			String sql = "SELECT cateno, title, subject, poster FROM category ORDER BY cateno ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCateNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println("catagoryAllData : " + ex.getMessage());
		} finally {
			disconnection();
		}

		return list;
	}
}
