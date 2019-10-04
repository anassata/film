package web;

import Dao.Dao;
import flexjson.JSONSerializer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
@WebServlet("/stats")
public class statsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Dao Dao = new Dao();

        List<Map<String,Object>> results = Dao.grafico();

        JSONSerializer serializer = new JSONSerializer();


        String  json=serializer.prettyPrint(true).deepSerialize(results);
        out.println(json);





    }
}
