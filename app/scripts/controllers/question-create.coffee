angular.module('topazApp')
  .controller 'QuestionCreateCtrl', ($scope, $state, Question) ->
    $scope.question = {}

    $scope.createQuestion = ->
      Question.create($scope.question.title).then (object) ->
        $scope.question = {}
        $state.go 'app.details', {'id': object.id}
