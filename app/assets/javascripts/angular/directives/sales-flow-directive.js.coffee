angular.module('app').directive('salesFlow',()->
	{
		restrict: 'E'
		templateUrl: 'sales_flow.html'
		scope: {
			
		},
		replace: true
		controller: 'SalesFlowController'
		link: (scope,element)->
			
	}
)