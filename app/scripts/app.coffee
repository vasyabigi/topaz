'use strict'

angular.module('topazApp', ['parse-angular', 'doowb.angular-pusher', 'ui.router'])
  .config((PusherServiceProvider) ->
    Parse.initialize "fTTyy0H38pgtBgPNLvDZKOrvarGwe7DcLVFfYFdF", "IAsbU53QGranXVVMEfmT5AmArDaCRAu15xBmNyil"

    fbDeferred = $.Deferred()
    window.fbPromise = fbDeferred.promise()
    window.fbAsyncInit = ->
      fbDeferred.resolve()

    PusherServiceProvider.setToken('83915278656e66d15149').setOptions({})

    window.fbPromise.then( ->
      Parse.FacebookUtils.init
        appId: 1375696209371723 # Facebook App ID
        status: true # check login status
        cookie: true # enable cookies to allow Parse to access the session
        xfbml: true # parse XFBML
        frictionlessRequests: true # recommended
    )
  )
