package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.dao.UserDAOImpl;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw;
		try {
			resp.setContentType("text/html");
			// get the printWriter object::
			pw = resp.getWriter();
			// get the values from request object:
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("pass");
			String checkout = req.getParameter("check");

			// System.out.println(name + " " + email + " " + phno + " " + password + " " +
			// checkout);

			// for set the values in user variables by setter Method
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
 			user.setPassword(password);
  
 			// this is for send check button msg to user
 			HttpSession session =req.getSession();
 			
 			
			if (checkout != null) {
				/**
				 * then we create a UserDAOImpl Class Object::: because this class have a
				 * userRegister() Method for Registration
				 **/
				UserDAO dao = new UserDAOImpl(DBConnect.getConnection());
				boolean result = dao.userRegister(user);
				if (result) {
					
					session.setAttribute("successMsg", "Registration Succesfully");
					  resp.sendRedirect("Register.jsp");
					//System.out.println("user Registration Succes....");

				} else {
					System.out.println("Something  Wrong on server......");
                     
				}
			} else {
				//System.out.println("");
				session.setAttribute("failMsg","please check Agree Terms & condition");
			    resp.sendRedirect("Register.jsp");
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
