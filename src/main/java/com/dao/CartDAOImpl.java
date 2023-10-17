package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean flag = false;

		try {
			String sql = "insert into cart(bid,uid,bookName,author ,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, c.getBid());
			psmt.setInt(2, c.getUserId());
			psmt.setString(3, c.getBookName());
			psmt.setString(4, c.getAuthor());
			psmt.setDouble(5, c.getPrice());
			psmt.setDouble(6, c.getTotal_price());

			int ans = psmt.executeUpdate();
			if (ans == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
