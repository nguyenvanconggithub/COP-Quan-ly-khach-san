package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ChamberDAO;
import model.Chamber;

@WebServlet(urlPatterns = { "/viewChamber", "/addChamber", "/editChamber", "/removeChamber" })
public class ManageChamber extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getServletPath().equals("/viewChamber") && req.getSession().getAttribute("role").equals(0)) {
			viewChamber(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getServletPath().equals("/addChamber") && req.getSession().getAttribute("role").equals(0)) {
			addChamber(req, resp);
		}
		if (req.getServletPath().equals("/editChamber") && req.getSession().getAttribute("role").equals(0)) {
			editChamber(req, resp);
		}
		if (req.getServletPath().equals("/removeChamber") && req.getSession().getAttribute("role").equals(0)) {
			removeChamber(req, resp);
		}
	}

	private void viewChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int totalChamber = ChamberDAO.Instance().numberOfChamber();
		int itemsPerPage = 10;
        int page = 1;
        int lastPage = 1;
        int range = 5;
        int middle = (int) Math.ceil((float) range / 2);
        int min = 1;
        int max = range;
        String pageRequest = req.getParameter("page");
        //if no pageRequest => load page 1
        if (pageRequest == null) {
            lastPage = (int) Math.ceil((float) totalChamber / itemsPerPage);
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
            lastPage = (int) Math.ceil((float) totalChamber / itemsPerPage);
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
                    }else{
                        max = lastPage;
                        min = max - range + 1;
                    }

                }
            }
        }
        
        ArrayList<Chamber> listChamber = ChamberDAO.Instance().getChamberInfoByPage(page, itemsPerPage);
        req.setAttribute("totalChamber", totalChamber);
        req.setAttribute("listChamber", listChamber);
        req.setAttribute("itemsPerPage", itemsPerPage);
        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("min", min);
        req.setAttribute("max", max);
        
        req.getRequestDispatcher("manageChamber.jsp").forward(req, resp);
	}

	private void addChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		boolean addSuccess = false;
		
		String number = req.getParameter("number");
		String floor = number.substring(0, 1);
		String price = req.getParameter("price");
		String area = req.getParameter("area");
		String vip = req.getParameter("vip");
		String type = req.getParameter("type");
		String note = req.getParameter("note");
		
		if(ChamberDAO.Instance().alreadyHaveRoom(number)) {
			req.setAttribute("roomExists", true);
			req.setAttribute("roomNum", number);
			viewChamber(req, resp);
			return;
		}
		Chamber newChamber = new Chamber();
		newChamber.setNumber(number);
		newChamber.setFloor(Integer.parseInt(floor));
		newChamber.setPrice(Long.parseLong(price));
		newChamber.setArea(Float.parseFloat(area));
		if(vip != null) {
			newChamber.setVip(true);
		}else {
			newChamber.setVip(false);
		}
		switch (type) {
		case "single":
			newChamber.setType(0);
			newChamber.setCapacity(1);
			break;
		case "couple":
			newChamber.setCapacity(2);
			newChamber.setType(1);
		case "family":
			newChamber.setCapacity(4);
			newChamber.setType(2);
		}
		newChamber.setNote(note);
		
		addSuccess = ChamberDAO.Instance().insertNewChamber(newChamber);
		req.setAttribute("addSuccess", addSuccess);
		viewChamber(req, resp);
		
	}

	private void editChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		boolean addSuccess = false;
		
		String number = req.getParameter("number");
		String floor = number.substring(0, 1);
		String price = req.getParameter("price");
		String area = req.getParameter("area");
		String vip = req.getParameter("vip");
		String type = req.getParameter("type");
		String note = req.getParameter("note");
		String id = req.getParameter("id");
		
		Chamber newChamber = new Chamber();
		newChamber.setNumber(number);
		newChamber.setFloor(Integer.parseInt(floor));
		newChamber.setPrice(Long.parseLong(price));
		newChamber.setArea(Float.parseFloat(area));
		if(vip != null) {
			newChamber.setVip(true);
		}else {
			newChamber.setVip(false);
		}
		switch (type) {
		case "single":
			newChamber.setType(0);
			newChamber.setCapacity(1);
			break;
		case "couple":
			newChamber.setCapacity(2);
			newChamber.setType(1);
		case "family":
			newChamber.setCapacity(4);
			newChamber.setType(2);
		}
		newChamber.setNote(note);
		
		addSuccess = ChamberDAO.Instance().updateChamberInfo(newChamber, Integer.parseInt(id));
		req.setAttribute("addSuccess", addSuccess);
		viewChamber(req, resp);
	}

	private void removeChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String removeID = req.getParameter("id");
		boolean addSuccess = false;
		addSuccess = ChamberDAO.Instance().removeChamberByID(removeID);
		req.setAttribute("addSuccess", addSuccess);
		viewChamber(req, resp);
	}

}
