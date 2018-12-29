package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDAO;

public class LoginController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession hs = req.getSession();
		
		String uName = req.getParameter("uName");
		String pWord = req.getParameter("pWord");
		String loginType = req.getParameter("loginType");
		
		if(loginType.equals("admin")) {
			if(UserDAO.verifyAdmin(uName, pWord)) {
				hs.setAttribute("uName", uName);
				hs.setAttribute("pWord", pWord);
				hs.setAttribute("loginType", loginType);
				RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
				//resp.getWriter().println("Login Success!");
				rd.forward(req, resp);
			}else {
				hs.invalidate();
				RequestDispatcher rd = req.getRequestDispatcher("ErrorLogin.jsp");
				rd.forward(req, resp);
			}
		}else{
			if(UserDAO.verifyUser(uName, pWord)) {
				hs.setAttribute("uName", uName);
				hs.setAttribute("pWord", pWord);
				hs.setAttribute("loginType", loginType);
				RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
				//resp.getWriter().println("Login Success!");
				rd.forward(req, resp);
			}else {
				hs.invalidate();
				RequestDispatcher rd = req.getRequestDispatcher("ErrorLogin.jsp");
				rd.forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
