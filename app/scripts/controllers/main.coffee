angular.module('topazApp')
  .controller 'MainCtrl', ($scope, $state, User, Question, Choice) ->
    $scope.user = User.current()

    $scope.login = ->
      User.login().then((user) ->
        $scope.user = user
      )

    $scope.logout = ->
      User.logout()
      $scope.user = User.current()

    $scope.questions = []
    $scope.question = {}

    $scope.questions = new Question.collection()
    $scope.questions.query().find()

    $scope.createQuestion = (form) ->
      form.submitted = false

      if form.$valid
        # Assign current user to question
        $scope.question.user = User.current()

        # Save question to backend and redirect to details page
        $scope.questions.addQuestion($scope.question).then (question) ->
          $state.go 'app.details', 'id': question.id

          # choiceCollection = new Choice.collection()
          # choiceCollection.forQuestion(question).then((choices) ->
          #   console.log choices
          # )
      else
        form.submitted = true
