'use strict'

angular.module('topazApp')
  .controller 'MainCtrl', ($scope, Pusher, Topaz) ->
    # ALL CODE INSIDE IS ONLY FOR TESTS
    $scope.user = Parse.User.current()

    $scope.login = ->
      Parse.FacebookUtils.logIn 'email',
        success: (user) ->
          unless user.existed()
            console.log "User signed up and logged in through Facebook!"
            FB.api('/me', {fields: 'name,email,username,link'}, (response) ->
              user.save(
                name: response.name
                username: response.username
                email: response.email
                link: response.link
              ).then((respone) ->
                $scope.user = respone
              )
            )
          else
            console.log "User logged in through Facebook!"
            $scope.user = user

        error: (user, error) ->
          alert "User cancelled the Facebook login or did not fully authorize."

    $scope.logout = ->
      $scope.user = Parse.User.logOut()

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
