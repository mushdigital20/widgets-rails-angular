angular.module('app').directive 'workLocation',->
	{
		restrict:'EA'
		replace:true
		templateUrl:"work_location.html"
		controller:'WorkLocationController'
	}