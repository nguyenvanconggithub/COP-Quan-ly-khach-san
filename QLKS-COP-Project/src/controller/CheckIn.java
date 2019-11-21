package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import connection.ChamberDAO;
import connection.GuestDAO;
import dto.AjaxRespond;
import dto.CheckInInfoDto;
import model.Chamber;

@WebServlet(urlPatterns = { "/check-in", "/find-chamber", "/rent-chamber" })
public class CheckIn extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("role") == null) {
			resp.sendRedirect("/login");
		} else {
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/check-in")) {
				checkIn(req, resp);
			}
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/find-chamber")) {
				findChamber(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/rent-chamber")) {
			rentChamber(req, resp);
		}
	}

	private void checkIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int chamberType = null == req.getParameter("t") || "".equals(req.getParameter("t")) ? 0
				: Integer.valueOf(req.getParameter("t"));// check type is null or empty string
		int priceType = null == req.getParameter("p") || "".equals(req.getParameter("p")) ? 0
				: Integer.valueOf(req.getParameter("p"));// check price is null or empty string
		boolean checkPrice0 = false;
		boolean checkPrice1 = false;
		boolean checkPrice2 = false;
		boolean checkType0 = false;
		boolean checkType1 = false;
		boolean checkType2 = false;
		switch (priceType) {
		case 0:
			checkPrice0 = true;
			break;
		case 1:
			checkPrice1 = true;
			break;
		default:
			checkPrice2 = true;
			break;
		}

		switch (chamberType) {
		case 0:
			checkType0 = true;
			break;
		case 1:
			checkType1 = true;
			break;
		default:
			checkType2 = true;
			break;
		}
		int totalChamber = ChamberDAO.totalChambers(chamberType, priceType);
		int items = 12;
		int page = 1;
		int lastPage = 1;
		int range = 5;
		int middle = (int) Math.ceil((float) range / 2);
		int min = 1;
		int max = range;
		String pageRequest = req.getParameter("page");
		// if no pageRequest => load page 1
		if (pageRequest == null) {
			lastPage = (int) Math.ceil((float) totalChamber / items);
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
			lastPage = (int) Math.ceil((float) totalChamber / items);
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
		List<Chamber> chambers = ChamberDAO.getChamberCheckIn(chamberType, priceType, page, items);
		req.setAttribute("chambers", chambers);
		// set parameter
		req.setAttribute("currentType", chamberType);
		req.setAttribute("currentPrice", priceType);
		// set checkbox type
		req.setAttribute("checkType0", checkType0);
		req.setAttribute("checkType1", checkType1);
		req.setAttribute("checkType2", checkType2);
		// set checkbox price
		req.setAttribute("checkPrice0", checkPrice0);
		req.setAttribute("checkPrice1", checkPrice1);
		req.setAttribute("checkPrice2", checkPrice2);
		// set pagination
		req.setAttribute("totalChamber", totalChamber);
		req.setAttribute("itemsPerPage", items);
		req.setAttribute("page", page);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("min", min);
		req.setAttribute("max", max);
		req.getRequestDispatcher("checkIn.jsp").forward(req, resp);
	}

	private void findChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long chamberId = Long.valueOf(req.getParameter("id"));
		Gson gson = new Gson();
		Chamber chamber = ChamberDAO.findChamberById(chamberId);
		PrintWriter out = resp.getWriter();
		out.print(gson.toJson(chamber));
		out.flush();
		out.close();
	}

	private void rentChamber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(),"UTF-8"));
		String json = "";
		if (br != null) {
			json = br.readLine();
		}
		ObjectMapper mapper = new ObjectMapper();
		CheckInInfoDto checkInInfo = mapper.readValue(json, CheckInInfoDto.class);
		boolean checkUpdateChamber = ChamberDAO.updateChamberStatus(checkInInfo.getChamberId());
		boolean checkInsertGuest = GuestDAO.checkIn(checkInInfo.getGuest());
		AjaxRespond result = new AjaxRespond();
		if (checkInsertGuest && checkUpdateChamber) {
			result.setMessage("Check in thành công!");
		} else {
			result.setMessage("Thông tin lỗi vui lòng thử lại!");
		}
		resp.setContentType("application/json");
		mapper.writeValue(resp.getOutputStream(), result);
	}
}
