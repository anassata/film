package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
@WebServlet("/delete")
public class deleteServlet extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	     String title=request.getParameter("title");
	     String year=request.getParameter("year");
	     PrintWriter out = response.getWriter();
	     
	    
	     Dao Dao=new Dao();
	     
	     Dao.elimina(title,year);
	     
         
	     response.sendRedirect("/film/index.jsp");  
       
	     

	
	
	
	
	
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}

	
	
	

}
