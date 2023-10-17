package com.admin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BookDAO;
import com.dao.BookDAOImpl;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
			boolean ans = dao.deleteBook(id);
			HttpSession session = req.getSession();
			if (ans) {
				session.setAttribute("succMsg", "Book Delete Succesfully");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failMsg", "SomeThing went on server");
				resp.sendRedirect("admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
