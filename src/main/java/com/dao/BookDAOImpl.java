package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails bd) {
		boolean flag = false;

		try {
			String query = "insert into book_details(bookName,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, bd.getBookName());
			psmt.setString(2, bd.getAuthor());
			psmt.setString(3, bd.getPrice());
			psmt.setString(4, bd.getBookCategory());
			psmt.setString(5, bd.getStatus());
			psmt.setString(6, bd.getPhoto());
			psmt.setString(7, bd.getEmail());

			int ans = psmt.executeUpdate();
			if (ans == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return flag;
	}

	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details";
			PreparedStatement psmt = conn.prepareStatement(sql);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public BookDetails getBookById(int id) {

		BookDetails b = null;
		try {
			String sql = "select*from book_details where bookId=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditBooks(BookDetails bd) {
		boolean flag = false;
		try {

			String sql = "update book_details set bookName=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, bd.getBookName());
			psmt.setString(2, bd.getAuthor());
			psmt.setString(3, bd.getPrice());
			psmt.setString(4, bd.getStatus());
			psmt.setInt(5, bd.getBookId());
			int ans = psmt.executeUpdate();
			if (ans == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean deleteBook(int id) {
		boolean flag = false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			int ans = psmt.executeUpdate();
			if (ans == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "New Book");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getAllNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getAllOldBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select*from book_details where bookCategory=? and status=? order by bookId DESC ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
