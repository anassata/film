<%@page import="Dao.Dao"%>
<%@page import="Dao.Configuration"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
  
  <head>
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
        
        <!-- FINE FORM -->
        
      </div>
    </div>
	
	<!-- +++++ Projects Section +++++ -->
	
	<!-- +++++ Contact Section +++++ -->
	
	<div class="container pt">
		<div class="row mt">
			<div class="col-lg-6 col-lg-offset-3 centered">
				<h3>MODIFICA FILM O SERIE TV</h3>
        <hr>
			</div>
		</div>
		<div class="row mt">	
			<div class="col-lg-8 col-lg-offset-2">
			<%
			String host= Configuration.DB_URL;
			Statement stat=null;
			ResultSet res=null;
			PreparedStatement stmt=null;
			Class.forName(Configuration.JDBC_DRIVER);
			Connection conn=DriverManager.getConnection(host,Configuration.USER,Configuration.PASS);
			
			
			
			
			
			
			%>
				<form  name="myForm2" onsubmit="return validateForm()" action="" method="post"  >
				<%
				
				stat=conn.createStatement();
				String titolo=request.getParameter("title");
				String genere=request.getParameter("genre");
				String recensione=request.getParameter("review");
				String anno =request.getParameter("year");
			
				
				
				%> 
				
          
          <div class="form-group">   
              <input type="text" name="t" class="form-control"   value="<%=request.getParameter("title") %>" placeholder="titolo" required>
              <br>
            </div>
				  <div class="form-group">
				    <input type="text" name="y" class="form-control"   value="<%=request.getParameter("year") %>"  placeholder="anno" required>
				    <br>
				  </div>
          <div class="form-group">
            <label for="sel1">Select list:</label>
            <select input type="text" name="g" class="form-control" value="<%=request.getParameter("genre") %>" placeholder="genre"  required>
              <option>Drammatico</option>
              <option>Horror</option>
              <option>Commedia</option>
              <option>Thriller</option>
              <option>Azione</option>
              <option>Gangster/Criminale</option>
              <option>Fantasy</option>
              <option>Biografico</option>
              <option>Avventura</option>
              
            </select>
          </div>
				  <textarea input type="text" name="r" class="form-control" rows="8"  value="<%=request.getParameter("review") %>"  placeholder="Modifica la tua recensione"  required></textarea>
				    <br>
				    <button input id="show" type="submit" class="btn btn-success" >INVIA</button>
        </form> 


        <!-- qui finisce il form -->


			</div>
		</div><!-- /row -->
  </div><!-- /container -->
  
	
	<!-- +++++ Footer Section +++++ -->
	
	<div id="footer">
		<div class="container">
			<div class="row">
			</div>
		
		</div>
	</div>
	
<script>
function validateForm() {
  var x = document.forms["myForm"]["year"].value;
  if (isNaN(x)) {
	    alert("devi inserire un numero nel campo anno");
	    return false;
	  }
}

function validateForm() {
	  var x = document.forms["myForm2"]["y"].value;
	  if (isNaN(x)) {
		    alert("Non puoi inserire un anno che non sia numerico");
		    return false;
		  }
	}

</script>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>

<%





String t=request.getParameter("t");
String y=request.getParameter("y");
String r=request.getParameter("r");
String g=request.getParameter("g");
if(t!=null & y!=null &r!=null &g!=null )
{
	String query="update myfilms set title=\""+t+"\",genre=\""+g+"\",review=\""+r+"\",year="+y+ " where title like \""+ titolo + "%\" and year= " + anno;
	System.out.println(query);
	System.out.println(t);
	System.out.println(y);
	System.out.println(r);
	System.out.println(g);
	stmt=conn.prepareStatement(query);

	stmt.executeUpdate(query);
	
	response.sendRedirect("index.jsp");
	
	
}
	


%>
