package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import database.UserDAO;

public class RegController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getParameter("pWord").equals(req.getParameter("repWord"))) {
			User u = new User(
					req.getParameter("uName"),
					req.getParameter("pWord"),
					req.getParameter("fName"),
					req.getParameter("lName"),
					req.getParameter("addr"),
					req.getParameter("mid"),
					Long.parseLong(req.getParameter("phno")));
			if(UserDAO.addUser(u)) {
				resp.getWriter().println("Regstration Successful!");
				RequestDispatcher rd = req.getRequestDispatcher("register.html");
				rd.include(req, resp);
			}else {
				req.setAttribute("reason","Database Error.");
				RequestDispatcher rd = req.getRequestDispatcher("ErrorReg.jsp");
				rd.forward(req, resp);
			}
		}else {
			req.setAttribute("reason","ReTyped Password not matching.");
			RequestDispatcher rd = req.getRequestDispatcher("ErrorReg.jsp");
			rd.forward(req, resp);
		}
	}
}
