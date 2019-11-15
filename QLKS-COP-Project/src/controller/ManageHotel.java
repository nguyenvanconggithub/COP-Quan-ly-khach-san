package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connection.HotelDAO;
import connection.ImageDAO;
import connection.ServiceDAO;
import model.Hotel;
import model.Image;

@WebServlet(urlPatterns = "/manage-hotel")
@MultipartConfig()
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
			String[] newServiceNames = req.getParameterValues("services");
			
			if(hotelName != null && hotelAddress != null && hotelStar != null) {
				infoHotel.setAddress(hotelAddress);
				infoHotel.setHotelName(hotelName);
				infoHotel.setStar(Integer.parseInt(hotelStar));
			}
			if(HotelDAO.Instance().alreadyHaveData()) {
				//update
				HotelDAO.Instance().updateInfo(infoHotel);
				ServiceDAO.Instance().removeAllService();
				for(String serviceName : newServiceNames) {
					ServiceDAO.Instance().setNewService(serviceName);
				}
	            //ListRemoveImage pattern "55-88-77-66-22-11-44-66,..." number is idImage
	            if(!req.getParameter("listRemoveImage").equals("")){
	                String[] listRemoveID = req.getParameter("listRemoveImage").split("-");
	                for(String removeID : listRemoveID){
	                    //get link image and remove file equal that link
	                    String removeImageFile = req.getServletContext().getRealPath(ImageDAO.Instance().getImageLinkByID(removeID));
	                    File removeFile = new File(removeImageFile);
	                    removeFile.delete();
	                    //remove record where ID Image = removeID
	                    ImageDAO.Instance().removeImageByID(removeID);
	                }
	            }
	            /*GET IMAGE FROM REQUEST AND SAVE TO SERVER + SAVE TO DATABASE*/
	            try {
	                String SAVE_DIRECTORY = "images";
	                // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	                String appPath = req.getServletContext().getRealPath("");
	                appPath = appPath.replace('\\', '/');

	                // Thư mục để save file tải lên.
	                String fullSavePath = null;
	                if (appPath.endsWith("/")) {
	                    fullSavePath = appPath + SAVE_DIRECTORY;
	                } else {
	                    fullSavePath = appPath + "/" + SAVE_DIRECTORY;
	                }
	                // Tạo thư mục nếu nó không tồn tại.
	                File fileSaveDir = new File(fullSavePath);
	                if (!fileSaveDir.exists()) {
	                    fileSaveDir.mkdir();
	                }
	                // Danh mục các phần đã upload lên (Có thể là nhiều file).
	                for(Part part : req.getParts()) {
	                    String fileName = extractFileName(part);
	                    String randomName = random64Chars();
	                    if(fileName != null && fileName.length() > 0) {
	                        String filePath = fullSavePath + File.separator + randomName + fileName;
	                        String linkToSaveInSQL = SAVE_DIRECTORY + File.separator + randomName + fileName;
	                        //Save Link to SQL
	                        ImageDAO.Instance().setNewHotelImage(linkToSaveInSQL);
	                        // Ghi vào file.
	                        part.write(filePath);
	                    }

	                }
	                req.setAttribute("addSuccess", true);
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
	            } catch (Exception e) {
	            	e.printStackTrace();
	            	req.setAttribute("addSuccess", true);
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
	                System.out.println("Process File Fail with err: ");
	                req.getRequestDispatcher("manageHotel.jsp").forward(req, resp);
	            }
				
			}else {
				//insert
				HotelDAO.Instance().insertInfo(infoHotel);
				for(String serviceName : newServiceNames) {
					ServiceDAO.Instance().setNewService(serviceName);
				}
	            /*GET IMAGE FROM REQUEST AND SAVE TO SERVER + SAVE TO DATABASE*/
	            try {
	                String SAVE_DIRECTORY = "images";
	                // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	                String appPath = req.getServletContext().getRealPath("");
	                appPath = appPath.replace('\\', '/');

	                // Thư mục để save file tải lên.
	                String fullSavePath = null;
	                if (appPath.endsWith("/")) {
	                    fullSavePath = appPath + SAVE_DIRECTORY;
	                } else {
	                    fullSavePath = appPath + "/" + SAVE_DIRECTORY;
	                }
	                // Tạo thư mục nếu nó không tồn tại.
	                File fileSaveDir = new File(fullSavePath);
	                if (!fileSaveDir.exists()) {
	                    fileSaveDir.mkdir();
	                }
	                // Danh mục các phần đã upload lên (Có thể là nhiều file).
	                for (Part part : req.getParts()) {
	                    String fileName = extractFileName(part);
	                    String randomName = random64Chars();
	                    if (fileName != null && fileName.length() > 0) {
	                        String filePath = fullSavePath + File.separator + randomName + fileName;
	                        String linkToSaveInSQL = SAVE_DIRECTORY + File.separator + randomName + fileName;
	                        //Save Link to SQL
	                        ImageDAO.Instance().setNewHotelImage(linkToSaveInSQL);
	                        // Ghi vào file.
	                        part.write(filePath);
	                        
	                    }
	                }
	                req.setAttribute("addSuccess", true);
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
	            } catch (Exception e) {
	            	req.setAttribute("addSuccess", true);
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
	                System.out.println("Process File Fail with err: ");
	                e.printStackTrace();
	                return;
	            }
			}
		}
		
	}
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip

                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
    private String random64Chars() 
    { 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        StringBuilder sb = new StringBuilder(64); 
  
        for (int i = 0; i < 64; i++) { 
            int index 
                = (int)(AlphaNumericString.length() * Math.random()); 
            sb.append(AlphaNumericString.charAt(index)); 
        } 
  
        return sb.toString(); 
    } 
}
