angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, $state, questionId, Question, User) ->
    $scope.questionId = questionId
    Question.get(questionId).then((->), ->
      $state.go 'app.main'
    )
    if not User.isAuth()
      $state.go 'app.main'
