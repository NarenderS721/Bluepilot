package com.incapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.incapp.dao.DAO;

@WebServlet("/GetPhoto")
public class GetPhoto extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			String userType=request.getParameter("userType");
			DAO d=new DAO();
			byte image[]=d.getPhoto(email,userType);
			d.disconnect();
			if(image!=null) {
				response.getOutputStream().write(image);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
