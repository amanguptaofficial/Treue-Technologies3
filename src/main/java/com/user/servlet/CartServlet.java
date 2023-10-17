package com.user.servlet;

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
import com.dao.CartDAO;
import com.dao.CartDAOImpl;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			BookDAO dao = new BookDAOImpl(DBConnect.getConnection());
			BookDetails b = dao.getBookById(bid);
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));

		CartDAO dao1= new CartDAOImpl(DBConnect.getConnection());
		     boolean f=dao1.addCart(c); 
		     HttpSession session= req.getSession();
		    
		     
		if(f) 
		  {
			  session.setAttribute("addCart","Book Added to Cart");
		      resp.sendRedirect("All_NewBook.jsp");
		  }else {
			  session.setAttribute("addCart","Something Wrong On Server");
		      resp.sendRedirect("All_NewBook.jsp");
		  
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
