package Dao;



import org.apache.commons.dbutils.DbUtils;
import org.jetbrains.annotations.Contract;
import org.jetbrains.annotations.TestOnly;
import org.joda.time.Instant;
import org.joda.time.format.DateTimeFormat;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;


public class Dao {
	private String jdbcURL = Configuration.DB_URL;
	private String jdbcUsername = Configuration.USER;
	private String jdbcPassword = Configuration.PASS;


    public Dao() {

    }

    
    public static String removeLastChar(String s) {
        if (s == null || s.length() == 0) {
            return s;
        }
        return s.substring(0, s.length()-1);
    }

    public static List<Map<String, Object>> getallfilms() {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);


            String sql = "select * from myfilms ";
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            // Extract data from result set
            List<Map<String, Object>> results = new ArrayList();

            while (resultSet.next()) {
                Map<String, Object> record = new HashMap();

                record.put("user_id", resultSet.getString("user_id"));
                record.put("title", resultSet.getString("title"));
                record.put("year", resultSet.getString("year"));
                record.put("review", resultSet.getString("review"));
                record.put("genre", resultSet.getString("genre"));
                record.put("created_at", resultSet.getString("created_at"));
                String linkfilm="http://img.omdbapi.com/?t="+resultSet.getString("title")+"&apikey=5330e352";


                 linkfilm.replace("\\u0026", "&");
                 linkfilm.replaceAll(" ","");
                record.put("linkfilm",linkfilm);



                results.add(record);
            }


            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }


    public static List<Map<String, Object>> tabella2() {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);


            String sql = "select * from myfilms order by created_at desc  limit  1";
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            // Extract data from result set
            List<Map<String, Object>> results = new ArrayList();

            while (resultSet.next()) {
                Map<String, Object> record = new HashMap();

                record.put("user_id", resultSet.getString("user_id"));
                record.put("title", resultSet.getString("title"));
                record.put("year", resultSet.getString("year"));
                record.put("review", resultSet.getString("review"));
                record.put("genre", resultSet.getString("genre"));
                record.put("created_at", resultSet.getString("created_at"));
                String linkfilm="http://img.omdbapi.com/?t="+resultSet.getString("title")+"&year="+resultSet.getString("year")+"&apikey=5330e352";


                linkfilm.replace("\\u0026", "&");
                linkfilm.replaceAll(" ","");
                record.put("linkfilm",linkfilm);



                results.add(record);
            }


            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }


    public List<Map<String, Object>> grafico() {

        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);

            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);



            String sql = "select genre as name ,count(*)as value  from myfilms where genre is not null\n" +
                    "group by genre\n";

            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            // Extract data from result set
            List<Map<String, Object>> results = new ArrayList<>();

            while (resultSet.next()) {
                Map<String, Object> record = new HashMap<>();

                record.put("name", resultSet.getString("name"));
                record.put("value", resultSet.getString("value"));



                results.add(record);
            }


            return results;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }



    /*lista dei film per paginazione*/
    public static List<Film> listafilm(int start,int total) {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);


            String sql = "select * from myfilms  order by title limit "+(start-1)+","+total ;
            System.out.println(sql);
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            // Extract data from result set
            List<Film> film =new ArrayList<Film>();

            while (resultSet.next()) {
              Film f =new Film();


              f.setUserid(resultSet.getString("user_id"));
              f.setYear(resultSet.getInt("year"));
              f.setTitle(resultSet.getString("title"));
              f.setGenre(resultSet.getString("genre"));
              f.setReview(resultSet.getString("review"));
              f.setCreation(resultSet.getString("created_at"));

                String linkfilm="http://omdbapi.com/?t="+resultSet.getString("title")+"&apikey=5330e352";


                linkfilm.replace("\\u0026", "&");
                linkfilm.replaceAll(" ","");
                f.setLinkfilm(linkfilm);



                film.add(f);
            }


            return film;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }

    
    
    public  List<Film> ricercafilm(String titolo,String anno,int start,int total) {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);
String sql;
            if(anno=="")
            {
             sql = "select * from myfilms  where title like  \"%"+titolo+"%\"" + " order by title limit " + (start-1) + "," +  total ;
            }
            
            else
            {
            	 sql = "select * from myfilms   where title like  \"%"+titolo+"%\""+ " and year = "+ anno +" order by title limit " + (start-1) + "," + total ; 
            	
            }
            System.out.println(sql);
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            // Extract data from result set
            List<Film> film =new ArrayList<Film>();

            while (resultSet.next()) {
              Film f =new Film();


              f.setUserid(resultSet.getString("user_id"));
              f.setYear(resultSet.getInt("year"));
              f.setTitle(resultSet.getString("title"));
              f.setGenre(resultSet.getString("genre"));
              f.setReview(resultSet.getString("review"));
              f.setCreation(resultSet.getString("created_at"));

                String linkfilm="http://omdbapi.com/?t="+resultSet.getString("title")+"&apikey=5330e352";


                linkfilm.replace("\\u0026", "&");
                linkfilm.replaceAll(" ","");
                f.setLinkfilm(linkfilm);



                film.add(f);
            }


            return film;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

/*inserimento all'interno del database*/
    public static void inserisci(String userid,String title,String year,String review,String genre,String linkfilm) {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);

            String sql = "insert into myfilms values (\""+userid+"\",\""+title+" \",\""+year+"\",\""+genre+"\",\""+review+ "\",\""+linkfilm+"\",current_timestamp)";
            System.out.println(sql);
            preparedStatement = conn.prepareStatement(sql);
             preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }

    public static void elimina(String title,String year) {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);
            

            String sql = "delete  from myfilms where title like \""+ title + "%\" and year= " + year ;
            System.out.println(sql);
            preparedStatement = conn.prepareStatement(sql);
             preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }


    
    public static void update() {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);
            

            String sql = "update myfilms set year = 0  where year > 2019";
            System.out.println(sql);
            preparedStatement = conn.prepareStatement(sql);
             preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }





    public static int conta() {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);


            String sql = "select count(*) from myfilms ";
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            int ritorno=0;
            // Extract data from result set
            while (resultSet.next()) {



                ritorno=resultSet.getInt(1);





            }

            System.out.println(ritorno);
            return ritorno;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }
    
    
    public static int contaricerca(String titolo,String anno) {


        Connection connection = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {

            Class.forName(Configuration.JDBC_DRIVER);



            Connection conn = DriverManager.getConnection(Configuration.DB_URL, Configuration.USER, Configuration.PASS);
           String sql;
           if(anno == "")
           {
            sql = "select count(*) from myfilms where title like \"%"+ titolo  + "%\"";
           }

           else
           {
        	   
        	   sql = "select count(*) from myfilms where title like \"%"+ titolo + "%\" and year = " + anno;
           }
           
           System.out.println(sql);
           
            preparedStatement = conn.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            int ritorno=0;
            // Extract data from result set
            while (resultSet.next()) {



                ritorno=resultSet.getInt(1);





            }

            System.out.println(ritorno);
            return ritorno;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(preparedStatement);
            DbUtils.closeQuietly(connection);
        }


    }




}















