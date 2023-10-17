package com.user.servlet;

import java.io.IOException;

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

@WebServlet("/loginuser")
public class LoginServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			UserDAO userdao = new UserDAOImpl(DBConnect.getConnection());
			HttpSession session = req.getSession();
			// get the valuess:
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/Home.jsp");
			} else {

				User user = userdao.login(email, password);
				if (user != null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failMsg", "Email & password Invalid");
					resp.sendRedirect("login.jsp");
				}

				//resp.sendRedirect("Home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
