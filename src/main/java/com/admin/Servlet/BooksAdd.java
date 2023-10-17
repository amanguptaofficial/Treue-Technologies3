package com.admin.Servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.dao.BookDAO;
import com.dao.BookDAOImpl;
import com.entity.BookDetails;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String bookStatus = req.getParameter("bstatus");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			BookDetails bd = new BookDetails(bookName, author, price, categories, bookStatus, fileName, "admin");
			BookDAO dao = new BookDAOImpl(DBConnect.getConnection());

			
          
			boolean f = dao.addBooks(bd);
			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("")+"books";

		          File file= new File(path);
		          part.write(path+ File.separator+fileName );         
				
				
				
				session.setAttribute("succMsg", "Book Add SuccessFully");
				resp.sendRedirect("admin/add_books.jsp");

			} else {
				session.setAttribute("failMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
