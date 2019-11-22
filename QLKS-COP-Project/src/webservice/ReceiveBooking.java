package webservice;

import java.io.IOException;

import javax.inject.Inject;
import javax.management.loading.PrivateClassLoader;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import connection.BookingDAO;
import model.Booking;
import utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-booking"})
public class ReceiveBooking extends HttpServlet {


	private static final long serialVersionUID = 7590927997101261591L;

	private BookingDAO bookingDAO;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		bookingDAO = new BookingDAO();
		Booking booking = new Booking();
		booking = HttpUtil.of(request.getReader()).toModel(Booking.class);
		bookingDAO.save(booking);
		
		// trả về json cho client
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), booking);
	}
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		bookingDAO = new BookingDAO();
		Booking booking = new Booking();
		booking = HttpUtil.of(request.getReader()).toModel(Booking.class);
		bookingDAO.update(booking);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), booking);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		bookingDAO = new BookingDAO();
		Booking booking = new Booking();
		booking = HttpUtil.of(request.getReader()).toModel(Booking.class);
		bookingDAO.delete(booking);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), booking.getBookingId());
	}

}
