angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, $state, currentQuestion, Choice) ->
    $scope.question = currentQuestion

    # Create choices collection
    $scope.choices = new Choice.collection()

    # Load choices for current question
    $scope.choices.forQuestion(currentQuestion)

    $scope.votes = []

    $scope.sortableOptions =
      placeholder: "choice-item choice-item_placeholder btn btn-info"
      connectWith: ".apps-container"
