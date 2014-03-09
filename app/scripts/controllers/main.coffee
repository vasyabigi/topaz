angular.module('topazApp')
  .controller 'MainCtrl', ($scope, $state, User, Question, Choice) ->
    $scope.question = {}

    $scope.questions = new Question.collection()

    # Load last 5 questions from backend
    $scope.questions.query().limit(5).find().then((response) ->
      _.each response, (quetion) ->
        # Add each question to scope
        $scope.questions.add quetion
    )

    $scope.createQuestion = (form) ->
      form.submitted = false

      if form.$valid
        # Assign current user to question
        $scope.question.user = User.current()

        # Save question to backend and redirect to details page
        $scope.questions.addQuestion($scope.question).then (question) ->
          $scope.question = {}
          $state.go 'app.details', 'id': question.id

      else
        form.submitted = true
