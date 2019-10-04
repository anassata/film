package web;

import Dao.Dao;
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
import java.util.Map;

@WebServlet("/form")
public class formServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String title=request.getParameter("title");
     String userid="anas";
     String year=request.getParameter("year");
     String genre=request.getParameter("genre");
     String review=request.getParameter("review");
        PrintWriter out = response.getWriter();
        
        
        String linkfilm="http://img.omdbapi.com/?t="+title+"&apikey=5330e352";


        linkfilm.replace("\\u0026", "&");
        linkfilm.replaceAll(" ","");
        	
         	
        	
        
        String result = title.trim();

     Dao Dao = new Dao();

     review=review.replace("\"","'");
     Dao.inserisci(userid,result,year,review,genre,linkfilm);
        List<Map<String,Object>> results = Dao.tabella2();
        System.out.println("valori inviati:");
        System.out.println(result);
        System.out.println(year);
        System.out.println(review);
        System.out.println("valori ricevuti");

        System.out.println(results.get(0).get("title"));
        System.out.println(results.get(0).get("year"));
        System.out.println(results.get(0).get("review"));
//        if(results.get(0).containsValue(title) &
//        results.get(0).containsValue(year) &
//        results.get(0).containsValue(review))
//        {
//
//
//            out.println("hai inviato correttamente i sequenti dati");
//
//        }
//        else
//            out.println("c'è stato qualche problema");
//
//




        JSONSerializer serializer = new JSONSerializer();


        String  json=serializer.prettyPrint(true).deepSerialize(results);
        out.println(json);


       
        response.sendRedirect("/film/index.jsp");  
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
