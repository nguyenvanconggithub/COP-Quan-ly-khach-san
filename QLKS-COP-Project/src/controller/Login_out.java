package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.AccountDAO;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class Login_out extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getServletPath().equals("/logout")) {
			req.getSession().invalidate();
		}
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String pass = req.getParameter("pass");
		
		if(AccountDAO.Instance().isExists(username, pass)) {
			req.getSession().setAttribute("username", username);
			req.getSession().setAttribute("role", AccountDAO.Instance().getAccountRole(username));
			resp.sendRedirect("home");
		}else {
			req.setAttribute("notExists", true);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
