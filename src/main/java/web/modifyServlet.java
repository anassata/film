package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
@WebServlet("/update")
public class modifyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String title=request.getParameter("title");
	     String year=request.getParameter("year");
	     String review=request.getParameter("review");
	     PrintWriter out = response.getWriter();
	     
	out.println("titolo : "+ title +",recensione: " + review ) ;
	     
	     
        
//	     response.sendRedirect("/film/index.jsp");  
      
		
		
	
	
	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
	
	
	
	
	

}
