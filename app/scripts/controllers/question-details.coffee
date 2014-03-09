angular.module('topazApp')
  .controller 'QuestionDetailsCtrl', ($scope, $state, currentQuestion, Choice) ->
    $scope.question = currentQuestion

    # Create choices collection
    $scope.choices = new Choice.collection()

    # Load choices for current question
    $scope.choices.forQuestion(currentQuestion)
  # .controller 'QuestionDetailsCtrl', ($scope, $state, questionData, Question, User) ->
  #   $scope.questionData = questionData

  #   $scope.choices = [{id: 1, name: 'Vova'}, {id: 2, name: 'Vasya'}, {id: 3, name: 'Timoha'}]
  #   $scope.selected = [{name: 'Sergii', id: 4}, {name: 'Andrii',id: 5}]

  #   $scope.sortableOptions = {
  #     placeholder: "choice-item choice-item_placeholder btn btn-info ",
  #     connectWith: ".apps-container",
  #     revert: 100
  #   };
