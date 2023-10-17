package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnect;
import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User user) {
		boolean flag = false;
		try {
			String query = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPhno());
			psmt.setString(4, user.getPassword());
			int ans = psmt.executeUpdate();
			if (ans == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public User login(String email, String password) {
		User user = null;
		try {
			String LOGIN_QUERY = "select*from user where email=? and password=?";
			Connection con = DBConnect.getConnection();
			PreparedStatement psmt = con.prepareStatement(LOGIN_QUERY);
			psmt.setString(1, email);
			psmt.setString(2, password);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPhno(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setLandmark(rs.getNString(6));
				user.setCity(rs.getString(7));
				user.setState(rs.getString(8));
				user.setPincode(rs.getString(9));
				user.setEmail(rs.getString(10));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return user;
	}

}
