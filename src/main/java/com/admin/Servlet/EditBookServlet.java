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
import com.entity.BookDetails;

@WebServlet("/editbooks")
public class EditBookServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String a = req.getParameter("ourId");
			String bookname = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String bookStatus = req.getParameter("bstatus");
			BookDetails b = new BookDetails();
			b.setBookId(Integer.parseInt(a));
			b.setBookName(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(bookStatus);

			BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
			boolean ans = dao.updateEditBooks(b);
			HttpSession session = req.getSession();
			if (ans) {
				session.setAttribute("succMsg", "Book update Successfully");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
