package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import connection.FoodDAO;
import connection.ImageDAO;
import connection.TBL_OrderDAO;
import dto.ImageFood;
import model.Food;
import model.TBL_Order;
import utils.HttpUtil;


@WebServlet(urlPatterns = {"/food"})
public class FoodController extends HttpServlet {

	private static final long serialVersionUID = -6913908520405848515L;
	
	private FoodDAO foodDAO;
	private Food food;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Food model = new Food();
		FoodDAO foodDAO = new FoodDAO();
		model.setListFood(foodDAO.findAll());	
		request.setAttribute("model", model);
		
		TBL_Order modelOrder = new TBL_Order();
		TBL_OrderDAO orderDAO = new TBL_OrderDAO();
		modelOrder.setListOrder(orderDAO.findAll());	
		request.setAttribute("modelOrder", modelOrder);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/manage_service.jsp");
    	rd.forward(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		foodDAO = new FoodDAO();
		food = new Food();
		food = HttpUtil.of(request.getReader()).toModel(Food.class);
		foodDAO.update(food);
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(),food);
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		foodDAO = new FoodDAO();
		food = new Food();
		food = HttpUtil.of(request.getReader()).toModel(Food.class);
		foodDAO.delete(food);
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(),food.getFoodId());
	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		 imageFood = new ImageFood(); 
//		 imageDAO = new ImageDAO(); 
//		 foodDAO = new FoodDAO();
//		 
//		 imageFood = HttpUtil.of(request.getReader()).toModel(ImageFood.class);
//		 String link = imageFood.getLink();
//		 imageDAO.save(link); 
//		 Long image_id = imageDAO.findOneByLink(imageFood.getLink()).getImageId(); 
//		 food = new Food(imageFood.getName(),imageFood.getType(),imageFood.getDescription(),
//		 imageFood.getPrice(), image_id); 
//		 foodDAO.save(food);
//
//
//	}
}
