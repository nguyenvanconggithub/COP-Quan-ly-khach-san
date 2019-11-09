package webservice;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import connection.ChamberDAO;
import connection.HotelDAO;
import connection.ImageDAO;
import connection.ServiceDAO;
import dto.HotelDTO;
import model.Chamber;
import model.Hotel;
import model.Image;
import model.Service;

@Path("/info-hotel")
public class InfoHotel {

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public HotelDTO getInfoHotel() {
		Hotel hotel = HotelDAO.getHotelInfo();
		String pricePerNight = HotelDAO.getPricePerNight();
		List<Image> images = ImageDAO.getImageHotel();
		List<Service> services = ServiceDAO.getHotelService();
		List<Chamber> chambers = ChamberDAO.getChamberWS();
		HotelDTO infoHotel = new HotelDTO(hotel, pricePerNight, images, services, chambers);
		return infoHotel;
	}
}
