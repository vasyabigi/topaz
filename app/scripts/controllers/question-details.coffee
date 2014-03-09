angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, $state, Question, User, currentQuestion) ->
    $scope.question = currentQuestion
