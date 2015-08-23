###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-15
###

angular.module('app').controller('WorkLocationController',['$scope','employeesService','bubblesService',($scope,employeesService,bubblesService)->

	#loads data from backend
	employeesService.getWorkLocations().then (data)->
    bubblesService.calculateMinMax(data.map)
    $scope.data = data.map
    $scope.isLoading = false
    $scope.chart.data.rows = data.graph.data;
    $scope.chart.options.slices = data.graph.slices

  $scope.chart = {};

  $scope.isLoading = true

  $scope.chart.data = {"cols":[{id: "t", label: "Location", type: "string"},{id: "s", label: "Total", type: "number"}]};
  $scope.chart.type = 'PieChart';
  $scope.chart.options = {legend: 'none',width:600,height:400,pieHole:0.4,chartArea:{width:'90%',height:'90%'},pieSliceText:'none'}

  $scope.initial = {center: { latitude: 8.252275, longitude:-161.423841}, zoom: 2}
  $scope.map = $scope.initial

  $scope.selectLocation = (center) ->
    console.log center
    if center.latitude and center.longitude
      $scope.map = {center: center, zoom: 5}
    else
      $scope.map = $scope.initial

  $scope.circleRadius = (size)->
    bubblesService.calculateRadius(size)

  $scope.showInfoWindow = (center)->
    $scope.map.center.latitude == center.latitude and $scope.map.center.longitude == center.longitude


])