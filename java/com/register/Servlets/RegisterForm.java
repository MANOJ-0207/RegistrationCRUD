package com.register.Servlets;


import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.register.dao.RowData;
import com.register.dao.SQLOperations;

/**
 * Servlet implementation class RegisterForm
 */
@WebServlet("/RegisteringForm")
public class RegisterForm extends HttpServlet {
	private static final long serialVersionUID = 517L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String rollNo =request.getParameter("rollNo");
		String name = request.getParameter("name");
		String mail= request.getParameter("mail");
		RowData rowData=new RowData(rollNo,name,mail);
		try 
		{
			SQLOperations.insertValue(rowData);
			response.sendRedirect("Registered.html");
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			response.sendRedirect("Fail.html");
			e.printStackTrace();
		}
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
