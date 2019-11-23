package utils;

import java.io.BufferedReader;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Booking;

public class HttpUtil {
	private String value;
	public  HttpUtil(String value) {
		this.value = value;
	}
	
	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
	
	public static HttpUtil of(BufferedReader reader) {
		StringBuilder sb = new StringBuilder();
		try {
			String line;
			while((line = reader.readLine())!=null) {
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new HttpUtil(sb.toString());
	}
}
