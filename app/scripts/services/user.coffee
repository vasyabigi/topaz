'use strict'

angular.module('topazApp')
  .factory 'User', ($q) ->
    login: ->
      deferred = $q.defer()

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
                deferred.resolve user
              )
            )
          else
            console.log "User logged in through Facebook!"
            deferred.resolve user

        error: (user, error) ->
          deferred.reject error

      deferred.promise

    logout: ->
      Parse.User.logOut()

    current: ->
      Parse.User.current()
