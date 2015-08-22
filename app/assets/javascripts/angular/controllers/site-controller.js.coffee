###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-15
###

class SiteController
	constructor: ($scope, uiGmapGoogleMapApi)->

		$scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 };

		@startMap(uiGmapGoogleMapApi)

	#start Map's API
	startMap:(mapAPI) ->
		mapAPI.then (maps)->
		

angular.module('app').controller 'SiteController', ['$scope','uiGmapGoogleMapApi',SiteController]