package web;


import Dao.Dao;
import Dao.Film;
import flexjson.JSONSerializer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;



    @WebServlet("/View")
    public class ViewServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        	
        	String spageid=request.getParameter("page");
        	String pagelimit=request.getParameter("pagelimit");
        	
        	int page=Integer.parseInt(spageid);  
        	int pagelim=Integer.parseInt(pagelimit);  
        	int currentpage=Integer.parseInt(spageid);
            int recordsPerPage = pagelim;
        	int noOfRecords = Dao.conta();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

                if(page==1){}  
                else{  
                    page=page-1;  
                    page=page*recordsPerPage+1;  
                }
             Dao Dao = new Dao();
             

             response.setContentType("text/html");
             PrintWriter out = response.getWriter();
             
             
               Dao.update();
            	 
            	 List<Film> list = Dao.listafilm(page,
                                     recordsPerPage);
           
            request.setAttribute("filmList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            //out.print("<h1>Page No: "+request.getParameter("page")+"</h1>");  
         //   out.print("<table border='1' cellpadding='4' width='60%'>");  
           // out.print("<tr><th>Id</th><th>Name</th><th>Salary</th>");  
            //for(Film e:list){  
              //  out.print("<tr><td>"+e.getTitle()+"</td><td>"+e.getYear()+"</td><td>"+e.getReview()+"</td></tr>");  
            //}  
            //out.print("</table>");
            
            JSONSerializer serializer = new JSONSerializer();

            if(page-1>=noOfRecords || currentpage<=0 || pagelim==0)
            {
           	 System.out.println("page: " +page);
           	 System.out.println("noOfRecords: "+ noOfRecords);
           	 out.println("\"errore\"");
           	 System.out.println(list.size());
           	 
           	 
            }
            else
            {
            String  json=serializer.prettyPrint(true).deepSerialize(list);
            int fetched=list.size();
            
            String jsonfinale= "{\"success\":{\"data\":"+ json+",\"page\":"+currentpage+",\"totalrecords\":"+noOfRecords+",\"pagelimit\":"+pagelim+",\"totalrecords\":"+noOfRecords+",\"fetched\":"+fetched+"}}";
            
            out.println(jsonfinale);
            
            }
    

            
            out.close();
    }
        
        
    }