angular.module('topazApp')
  .controller 'QuestionResultsCtrl', ($scope, results) ->
    $scope.results = results
