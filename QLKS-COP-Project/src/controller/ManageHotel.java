package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.HotelDAO;
import connection.ImageDAO;
import connection.ServiceDAO;
import model.Hotel;
import model.Image;

@WebServlet(urlPatterns = "/manage-hotel")
public class ManageHotel extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("role").equals(0)) {// 0 is SysAdmin
			if(HotelDAO.Instance().alreadyHaveData()) {
				Hotel hotelInfo = HotelDAO.Instance().getHotelInfomation();
				ArrayList<String> serviceNames = ServiceDAO.Instance().getAllServiceName();
				ArrayList<Image> hotelImage = ImageDAO.Instance().getAllHotelImage();
				
				if(hotelInfo != null && serviceNames != null && hotelImage != null) {
					req.setAttribute("HotelInfo", HotelDAO.Instance().getHotelInfomation());
					req.setAttribute("serviceNames", serviceNames);
					req.setAttribute("hotelImage", hotelImage);
					req.setAttribute("alreadyHaveData", true);
				}
				
			}else {
				req.setAttribute("alreadyHaveData", false);
			}
			req.getRequestDispatcher("manageHotel.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		if(req.getSession().getAttribute("role").equals(0)) { // 0 is SysAdmin
			Hotel infoHotel = new Hotel();
			String hotelName = req.getParameter("tenKhachSan");
			String hotelAddress = req.getParameter("diaChi");
			String hotelStar = req.getParameter("star");
			String[] serviceNames = req.getParameterValues("services");
			
			if(hotelName != null && hotelAddress != null && hotelStar != null) {
				infoHotel.setAddress(hotelAddress);
				infoHotel.setHotelName(hotelName);
				infoHotel.setStar(Integer.parseInt(hotelStar));
			}
			if(HotelDAO.Instance().alreadyHaveData()) {
				//update
				
			}else {
				//insert
			}
		}
	}
}
