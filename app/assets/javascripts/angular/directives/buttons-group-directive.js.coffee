angular.module('app').directive('buttonsGroup', ()-> 
	return { 
		restrict: 'E' 
		template: '<div id="tabs" class="{{cssClass}}"><div class="btn-group"><a class="btn btn-default btn-xs" href="#{{p | lowercase}}" id="{{p | lowercase}}-tab" role="tab" data-toggle="tab" aria-controls="{{p | lowercase}}" aria-expanded="true" ng-class="{\'btn-primary\' : $index == getSelectedTab()}" ng-repeat="p in list track by $index" ng-click="selectTab($index)">{{p}}</a></div></div>'
		scope:{
			onChangeCallback: '&'
			cssClass: '@'
		}
		link:(scope, element, attrs)->
			scope.list = JSON.parse(attrs.groups)
		controller: ($scope)->
			$scope.selectedTab = 0

			$scope.selectTab = (tab)->
				$scope.selectedTab = tab
				$scope.callback()

			$scope.getSelectedTab = ->
				$scope.selectedTab

			$scope.callback = ->
				$scope.onChangeCallback({selected:$scope.selectedTab}) if typeof $scope.onChangeCallback is 'function'

			$scope.callback()
	}
)