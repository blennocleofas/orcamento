// define angular module/app
var formApp = angular.module('formApp', []);

formApp.config(function($httpProvider) {
  var authToken;
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  return $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});

// create angular controller and pass in $scope and $http
function formController($scope, $http) {

	// create a blank object to hold our form information
	// $scope will allow this to pass between controller and view
	$scope.formData = {};
	$scope.formData.tipo = 'somente_ida';
	// process the form
	$scope.processForm = function() {
		$http({
	        method  : 'POST',
	        url     : 'api/atendimentos',
	        data    : $.param($scope.formData),  // pass in data as strings
	        headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
	    })
	        .success(function(data) {
	        	$('.step1').hide();
	        	$('.step2').show();
	            console.log(data);
	        });

	};

}