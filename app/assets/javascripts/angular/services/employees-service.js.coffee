
class EmployeesService
	constructor: (@$http)->
	getWorkLocations:->
		promise = @$http.get('employees/show-location').then((response)->
			return response.data;
		)
		return promise;

angular.module('app').service('employeesService',['$http',EmployeesService])