angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, questionData) ->
    $scope.pop = 'details'
    $scope.questionData = questionData;
