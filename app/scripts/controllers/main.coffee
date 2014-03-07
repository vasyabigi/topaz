angular.module('topazApp')
  .controller 'MainCtrl', ($scope, Pusher, Topaz, User, Question) ->
    # ALL CODE INSIDE IS ONLY FOR TESTS
    $scope.user = User.current()

    $scope.login = ->
      User.login().then((user) ->
        $scope.user = user
      )

    $scope.logout = ->
      User.logout()
      $scope.user = User.current()

    $scope.topaz = {}
    $scope.topazes = []
    $scope.createSomeTopaz = (form, topaz) ->
      form.submitted = false

      if form.$valid
        topaz.user = $scope.user
        test = new Topaz.model()
        test.save(topaz).then (response) ->
          $scope.data = response
          $scope.topaz = {}

          Parse.Cloud.run("hello", {id: response.id}, (results) ->
            console.log results
          )
      else
        form.submitted = true

    topazes = new Topaz.collection()

    topazes.query().limit(5).find().then((response) ->
      $scope.topazes = response
    )

    Pusher.subscribe('topazes', 'new', ((data) ->
      topazes.query().get(JSON.parse(data.body).id).then((response) ->
        $scope.topazes.unshift(response)
      )
    ))

    $scope.questions = []
    $scope.question = {}

    Question.all().then (items) ->
      $scope.questions = items

    $scope.createQuestion = ->
      Question.create($scope.question.title).then (object) ->
        $scope.question = {}
        Question.all().then (items) ->
          $scope.questions = items
