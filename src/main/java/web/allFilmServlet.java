package web;

import flexjson.JSONSerializer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
@WebServlet("/first")
public  class allFilmServlet extends HttpServlet {



    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Dao Dao = new Dao();

        List<Map<String,Object>> results = Dao.getallfilms();

        JSONSerializer serializer = new JSONSerializer();


        String  json=serializer.prettyPrint(true).deepSerialize(results);
        out.println(json);


    }
}
