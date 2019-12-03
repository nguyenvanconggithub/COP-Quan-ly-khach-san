package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import connection.GuestDAO;

@WebServlet(urlPatterns = { "/guest", "/guest/find-guest", "/guest/update" })
public class Guest extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("role") == null) {
			resp.sendRedirect("/login");
		} else {
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/guest")) {
				viewGuest(req, resp);
			}
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/guest/find-guest")) {
				findGuest(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession() == null) {
			resp.sendRedirect("/login");
		} else {
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/guest/update")) {
				updateGuest(req, resp);
			}
		}
	}

	private void viewGuest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String textSearch = req.getParameter("s") == null ? "" : req.getParameter("s");
		int totalGuest = GuestDAO.countTotalGuest(textSearch);
		int items = 10;
		int page = 1;
		int lastPage = 1;
		int range = 5;
		int middle = (int) Math.ceil((float) range / 2);
		int min = 1;
		int max = range;
		String pageRequest = req.getParameter("page");
		// if no pageRequest => load page 1
		if (pageRequest == null) {
			lastPage = (int) Math.ceil((float) totalGuest / items);
			if (lastPage <= range) {
				min = 1;
				page = 1;
				max = lastPage;
			}
			if (lastPage > range) {
				min = 1;
				page = 1;
				max = range;
			}

		} else { // if user request a page
			page = Integer.parseInt(pageRequest);
			lastPage = (int) Math.ceil((float) totalGuest / items);
			if (page <= 0) {
				page = 1;
			}
			if (page > lastPage) {
				page = lastPage;
			}
			if (lastPage <= range) {
				min = 1;
				max = lastPage;
			} else {
				if (page >= middle + 1) {
					if (page + middle - 1 <= lastPage) {
						min = page - middle + 1;
						max = page + middle - 1;
					} else {
						max = lastPage;
						min = max - range + 1;
					}

				}
			}
		}

		req.setAttribute("guests", GuestDAO.getListGuest(textSearch, page));
		req.setAttribute("textSearch", textSearch);
		// pagination
		req.setAttribute("totalGuest", totalGuest);
		req.setAttribute("itemsPerPage", items);
		req.setAttribute("page", page);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("min", min);
		req.setAttribute("max", max);
		req.getRequestDispatcher("guest.jsp").forward(req, resp);
	}

	private void findGuest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		long guestId = Long.valueOf(req.getParameter("id"));
		model.Guest guest = GuestDAO.findGuest(guestId);
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		out.print(gson.toJson(guest));
		out.flush();
		out.close();
	}

	private void updateGuest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName = req.getParameter("name");
		System.out.println(fullName);
		String idNo = req.getParameter("card");
		Boolean gender = Boolean.valueOf(req.getParameter("gender"));
		Date birth = null;
		try {
			birth = Date.valueOf(req.getParameter("birth"));
		} catch (java.lang.IllegalArgumentException e) {
			java.util.Date today = new java.util.Date();
			birth = new Date(today.getTime());
		}
		String passport = req.getParameter("passport");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		Long guestId = Long.valueOf(req.getParameter("id"));
		model.Guest guest = new model.Guest(guestId, fullName, birth, gender, address, idNo, passport, phone, email);
		GuestDAO.updateGuest(guest);
		resp.sendRedirect("/guest");
	}

}
