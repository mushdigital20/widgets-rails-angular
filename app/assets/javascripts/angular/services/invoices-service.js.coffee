
class InvoicesService
	constructor: (@$http)->
	getSalesFlow:->
		promise = @$http.get('invoices/sales-flow/clients').then((response)->
			return response.data;
		)
		return promise;

angular.module('app').service('invoicesService',['$http',InvoicesService])