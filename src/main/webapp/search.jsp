<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="Dao.Dao"%>
<%@ page import="Dao.Film"%>
<%@ page import="flexjson.JSONSerializer"%>
<%

   	 
    
%>
<html>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>My films</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
    <link href="assets/css/main.css" rel="stylesheet">
    <script src="assets/js/angular.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Static navbar -->
    <div class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">MY FILMS</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="addfilm.html">AGGIUNGI FILM</a></li>
            <li><a href="statistiche.html">STATISTICHE</a></li>
            <li><a href="search.html">CERCA IMMAGINE</a></li>
                      
          </ul>
        </div><!--/.nav-collapse -->
        
        
        <!-- INIZIO FORM -->

                                  <form name="myForm" action="search.jsp" onsubmit="return validateForm()" method="get">
        <div class="form-row align-items-center">
          <div class="col-auto">
            <label class="sr-only" for="inlineFormInput" >Titolo</label>
            <input type="text" class="form-control mb-4" id="inlineFormInput" placeholder="Titolo" name="title" required>
          </div>
         
          <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">Anno</label>
                <input id="anno" type="text" class="form-control mb-4" id="inlineFormInput"  placeholder="Anno" name="year">
              </div>
         <div class="col-auto">
                <label class="sr-only" for="inlineFormInput">pagina</label>
                <input type="hidden" class="form-control mb-4" id="inlineFormInput" value="1" name="page">
              </div>
                   
       
          <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-4">Cerca</button>
          </div>
        </div>
      </form>
        
        <!-- INIZIO FORM -->
      </div>
    </div>

<body>


<style>
.button {
  display: inline-block;
  padding: 1px 1px;
  font-size: 14px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.button2 {
  display: inline-block;
  padding: 1px 1px;
  font-size: 14px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #DB1F45;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button2:hover {background-color: #b51f3d}

.button2:active {
  background-color: #b51f3d;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


</style>


			<%
			String spageid=request.getParameter("page");
                		
			String titolo=request.getParameter("title");
			String anno=request.getParameter("year");
			System.out.println(spageid);
			int pageid=1;

			if(spageid=="null")
			{
				pageid=1;
			}
			
			else
			{
			 pageid=Integer.parseInt(spageid);
			}
            int total=5;
            
            if(pageid==1 ){}
            else{  
                pageid=pageid-1;  
                pageid=pageid*total+1;  
            }  
            int noOfRecords = Dao.contaricerca(request.getParameter("title"),request.getParameter("year"));
            
            
            
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / total);
           System.out.println("numero di record :"+ noOfRecords );
           System.out.println("totale :"+ total );
           System.out.println("numero di pagine : "+ noOfPages );

			Dao Dao=new Dao();

			List<Film> list = Dao.ricercafilm(titolo, anno,pageid,total);



			  response.setContentType("text/html");
			  
				 
				 
			
			
				int i = 1;
			%>

         <%
             if(list.isEmpty())
         %>

     <%  if(request.getParameter("page").equals("1") ) { %>
      <h1>RISULTATI TROVATI : <%=noOfRecords%>  Nome:"<%=request.getParameter("title")%>"  Anno:"<%=request.getParameter("year")%>"    </h1>
      
      <% } %>
      
			<%
			int k=0;
				for (Film u : list) {
					k++;
			%>
			<div>
			<h3># <%=k%></h3>
			<h3>titolo : <%=u.getTitle()%></h3>
			<img alt="niente" src="ciak.jpg" height="200" width="150">
			<p>anno: <%=u.getYear()%></p>
			<p>genere: <%=u.getGenre()%></p>
			<p>recensione: <%=u.getReview()%></p>
			<form  action="modifyfilm.jsp" method="get">
    <input type="hidden" name="title" value="<%=u.getTitle()%>"/>
    <input type="hidden" name="year" value="<%=u.getYear()%>"/>
    <input type="hidden" name="genre" value="<%=u.getGenre()%>"/>
    <input type="hidden" name="review" value="<%=u.getReview()%>"/>
        <button class="button" type ="submit"   value="1" >MODIFICA RECENSIONE</button>
</form>

	<form  action="delete" method="post">
    <input type="hidden" name="title" value="<%=u.getTitle()%>"/>
    <input type="hidden" name="year" value="<%=u.getYear()%>"/>
    <input type="hidden" name="genre" value="<%=u.getGenre()%>"/>
    <input type="hidden" name="review" value="<%=u.getReview()%>"/>
    <button class="button2"  type ="submit" value="1" type="submit">ELIMINA RECENSIONE</button>
</form>
			
			<hr/>
			
			</div>
			
			
			<%
				}
			%>
			
			<nav aria-label="Page navigation example">
          <ul class="pagination">
			
			<%
			for(int j=0;j<noOfPages;j++)
			{
			%>
			
			
			<li class="page-item" ><a class="page-link" href="search.jsp?title=<%=request.getParameter("title")%>&year=<%=request.getParameter("year") %>&page=<%=j+1%>"><%=j+1%></a></li>
			
			
			<%
			}
			%>
			
			  </ul>
</nav>
		</tbody>
		<script>
function validateForm() {
  var x = document.forms["myForm"]["year"].value;
  if (isNaN(x)) {
	    alert("devi inserire un numero nel campo anno");
	    return false;
	  }
}
</script>
		
</body>
</html>