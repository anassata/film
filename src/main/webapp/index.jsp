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
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
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
        
      </div>
    </div>

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

<style>
        a {
          text-decoration: none;
          display: inline-block;
          padding: 8px 16px;
        }
        
        a:hover {
          background-color: #ddd;
          color: black;
        }
        
        .previous {
          background-color: #f1f1f1;
          color: black;
        
        .next {
          background-color: #4CAF50;
          color: white;
        }
        
        .round {
          border-radius: 50%;
        }
        </style>
        </head>
        <body>
        


        
        

<div id="result"> </div>
    <a href="#" class="previous">&laquo; Previous</a>
    <a href="#" class="next">Next &raquo;</a>

<script>
 /* function fetchimages(titolo)
    { 
        console.log(titolo)
     $.get("http://www.omdbapi.com/?t="+this.titolo+"&apikey=5330e352", function(data, status){
     var res=data;
     
let images="download.png"
     if(res.Response=="True")
         
          images="matto";
         
        
         else
         images="download.png";
    

 console.log("immagine " + images)
 return images;

 });
    } */


$(function(){

   


var page=1;
var pagelimit=7;
var totalrecord=0;
    // handling the prev-btn
$(".previous").on("click",function(){
//
if(page>1){
    page--;
    fetchData();
}
console.log("Prev Page" + page);

});

    // handling the next-btn

    $(".next").on("click",function(){
        if(page*pagelimit < totalrecord)
        {
         page++;
         fetchData();
        }
         console.log("Next Page" + page);
    



});

fetchData();


function fetchData()
{


$.ajax({

url: "/film/View",
type:"GET",
data: {
    page:page,
    pagelimit:pagelimit


},
success:function(data) {
    // console.log(data);
var json=JSON.parse(data);
    if(json.success)
    {
        totalrecord=json.success.totalrecords;
    console.log(totalrecord)
    var dataArr= json.success.data;
    var html="";
    console.log(dataArr)
     var html="<h3>PAGE : " + page + "</h3>";






    for(var i=0;i<dataArr.length;i++)
    {

// finisce qui

    var k=i+1+(page-1)*pagelimit
    k=i+1;
let image=null;
console.log(image);
     
     html+="<div>"+
    //  "<h3>indice : " + k + "</h3>"+
     "<h3>title : " + dataArr[i].title+ "</h3>"+
     
     '<img src='+'"'+"ciak.jpg"+'"'+' height="200" width="150">'+
     "<p>year : " + dataArr[i].year + "</p>"+
     "<p>genre : " + dataArr[i].genre + "</p>"+
     "<p>recensione : " + dataArr[i].review + "</p>"+
     
		'<form  action="modifyfilm.jsp" method="get">'+
		 '<input type="hidden" name="title" value="'+dataArr[i].title+'"/>'+
		 '<input type="hidden" name="year" value="'+dataArr[i].year+'"/>'+
		 '<input type="hidden" name="genre" value="'+dataArr[i].genre+'"/>'+
		 '<input type="hidden" name="review" value="'+dataArr[i].review+'"/>'+
         '<button class="button" type ="submit"   value="1" >MODIFICA RECENSIONE</button>'
 +"</form>"+
	'<form  action="delete" method="post">'+
	 '<input type="hidden" name="title" value="'+dataArr[i].title+'"/>'+
	 '<input type="hidden" name="year" value="'+dataArr[i].year+'"/>'+
	 '<input type="hidden" name="genre" value="'+dataArr[i].genre+'"/>'+
	 '<input type="hidden" name="review" value="'+dataArr[i].review+'"/>'+
    '<button class="button2" type ="submit"   value="1" >ELIMINA RECENSIONE</button>'
+"</form>"+  


     
     
     
     
     
     
     
     
    // '<a class="btn btn-danger" href="delete?title='+  dataArr[i].title + '&year='+dataArr[i].year+'">Elimina Film</a>'+
    //'<a class="btn btn-success" href="modifyfilm.jsp?title='+  dataArr[i].title + '&year='+dataArr[i].year+ '&genre='+dataArr[i].genre+  '&review='+dataArr[i].review+'">Modifica Film</a>'+
  
    
     "<hr/>"
     "</div>";
    }

    $("#result").html(html);
   
    }
    
},
error:function(jqXHR,textStatus,errorThrown)
{
console.log(jqXHR);
console.log(textStatus);
console.log(errorThrown);


}

});



}
















});

function refreshPage(){
    window.location.reload();
} 


</script>
<script>
function validateForm() {
  var x = document.forms["myForm"]["year"].value;
  if (isNaN(x)) {
	    alert("devi inserire un numero nel campo anno");
	    return false;
	  }
}
</script>


		
	
	<!-- +++++ Footer Section +++++ -->
	
	
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>
