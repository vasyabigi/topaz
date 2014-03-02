'use strict'

angular.module('topazApp', ['parse-angular'])
  .config(->
    Parse.initialize "xybfNvfjOv2IKuUUpLgnImgPQm93FlwhIovKfeju", "n6ItrOMIIaXuXMssLW4rB3k0b5LKlVQPd0G5oQ0f"

    fbDeferred = $.Deferred()
    window.fbPromise = fbDeferred.promise()
    window.fbAsyncInit = ->
      fbDeferred.resolve()

    window.fbPromise.then( ->
      Parse.FacebookUtils.init
        appId: 1375696209371723 # Facebook App ID
        status: true # check login status
        cookie: true # enable cookies to allow Parse to access the session
        xfbml: true # parse XFBML
        frictionlessRequests: true # recommended
    )
  )
