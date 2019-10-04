
 	var app = angular.module('myApp', ['angularUtils.directives.dirPagination']);
     app.controller('myCtrl', function($scope, $http) {
       $http.get("http://localhost:8080/film/first")
       .then(function(response) {
           $scope.film = response.data;
           $scope.numLimit=200;
     $scope.readMore=function(){
     $scope.numLimit=10000;
     };
     $scope.readLess=function(){
     $scope.numLimit=200;
     };
           
       });
     
     
     });




     