package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import connection.BillDAO;
import connection.ChamberDAO;
import dto.AjaxRespond;
import dto.CheckOutDTO;
import dto.PaymentDTO;

@WebServlet(urlPatterns = { "/check-out", "/check-out/get-check-out-info", "/check-out/payment" })
public class CheckOut extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("role") == null) {
			resp.sendRedirect("/login");
		} else {
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/check-out")) {
				checkOut(req, resp);
			}
			if (req.getSession().getAttribute("role").equals(1)
					&& req.getServletPath().equals("/check-out/get-check-out-info")) {
				getCheckOutInfo(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("role") == null) {
			resp.sendRedirect("/login");
		} else {
			if (req.getSession().getAttribute("role").equals(1) && req.getServletPath().equals("/check-out/payment")) {
				payment(req, resp);
			}
		}
	}

	private void checkOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("chambers", BillDAO.getListChamberCheckOut());
		req.getRequestDispatcher("checkOut.jsp").forward(req, resp);
	}

	private void getCheckOutInfo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String chamberNumber = req.getParameter("n");
		CheckOutDTO checkOutInfo = BillDAO.getCheckOutInfo(chamberNumber);
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		out.print(gson.toJson(checkOutInfo));
		out.flush();
		out.close();
	}

	private void payment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(), "UTF-8"));
		String json = "";
		if (br != null) {
			json = br.readLine();
		}
		ObjectMapper mapper = new ObjectMapper();
		PaymentDTO paymentDTO = mapper.readValue(json, PaymentDTO.class); // must initialize constructor empty
		boolean checkUpdateChamber = ChamberDAO.updateChamberStatus(paymentDTO.getChamberId(), false);
		boolean checkUpdateBill = BillDAO.updateBill(paymentDTO.getBillId(), paymentDTO.removeDot());
		AjaxRespond result = new AjaxRespond();
		if (checkUpdateChamber && checkUpdateBill) {
			result.setMessage("Thanh toán thành công!");
		} else {
			result.setMessage("Lỗi vui lòng thử lại sau!");
		}
		resp.setContentType("application/json");
		mapper.writeValue(resp.getOutputStream(), result);
	}

}
