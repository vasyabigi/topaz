angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, $state, questionId, Question) ->
    $scope.questionId = questionId
    Question.get(questionId).then((->), ->
      $state.go 'app.main'
    )
