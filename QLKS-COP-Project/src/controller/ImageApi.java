package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connection.FoodDAO;
import connection.ImageDAO;
import model.Food;
import Image.Compress.balanced.*;
@MultipartConfig
@WebServlet(urlPatterns = {"/image-api"})
public class ImageApi extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private FoodDAO foodDAO = new FoodDAO();
	private Food food;
	private ImageDAO imageDAO = new ImageDAO(); 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String link = uploadFile(request);
		link = "images/"+link;
		
		
		String name=request.getParameter("nameadd");
		String type=request.getParameter("typeadd");
		String description=request.getParameter("descriptionadd");
		String pricestr=request.getParameter("priceadd");
		long price = Long.parseLong(pricestr);
		 

		 
		 imageDAO.save(link); 
		 Long image_id = imageDAO.findOneByLink(link).getImageId(); 
		 
		 food = new Food(name,type,description,price, image_id); 
		 foodDAO.save(food);
		
		//tro lai trang
		
		 response.sendRedirect(request.getContextPath()+"/food");
		 
		
		/*
		 * imageFood = new ImageFood(); imageDAO = new ImageDAO(); foodDAO = new
		 * FoodDAO();
		 * 
		 * imageFood = HttpUtil.of(request.getReader()).toModel(ImageFood.class);
		 * imageDAO.save(imageFood.getLink()); Long image_id =
		 * imageDAO.findOneByLink(imageFood.getLink()).getImageId(); food = new
		 * Food(imageFood.getName(),imageFood.getType(),imageFood.getDescription(),
		 * imageFood.getPrice(), image_id); foodDAO.save(food);
		 */

	}
	private String uploadFile(HttpServletRequest request) throws IOException, ServletException {

		String fileName = "";
		try {
			Part filePart = request.getPart("real");
			

			fileName = (String) getFileName(filePart);
			String applicationPath = request.getServletContext().getRealPath("");
			String basePath = applicationPath + "images" + File.separator;
			
			BLdown.ImageToPath(filePart.getInputStream(), basePath + fileName); 
			
			/*InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				File outputFilePath = new File(basePath + fileName);
				inputStream = filePart.getInputStream();
				outputStream = new FileOutputStream(outputFilePath);
				int read = 0;
				final byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
			} catch (Exception e) {
				e.printStackTrace();
				fileName = "";
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
			}*/

		} catch (Exception e) {
			fileName = "";
			e.printStackTrace();
		}

		return fileName;
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}

		return null;
	}
}
