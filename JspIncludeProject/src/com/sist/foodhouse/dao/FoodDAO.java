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
			// ����� ��ġ -> �ּҰ� �б� -> �̸����� ���丮�� ���� �� (JNDI)
			Context init = new InitialContext(); // Ž������ ������ ��?
			Context c = (Context) init.lookup("java://comp/env"); // �� �ȿ� �ּҰ��� ����Ǿ� �ִٴ� ��.
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

	// ī�װ� ����
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
