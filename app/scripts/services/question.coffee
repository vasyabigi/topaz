'use strict'

angular.module('topazApp')
  .factory 'Question', ($q)->
    Question = Parse.Object.extend(
      className: 'Question'
      getTitle: -> @get 'title'
    )

    Questions = Parse.Collection.extend
      model: Question

    create: (title) ->
      deferred = $q.defer()

      model = new Question()
      model.save({title: title},
        success: (result) ->
          asJSON = result.toJSON()
          deferred.resolve asJSON
      )

      deferred.promise

    all: ->
      deferred = $q.defer()

      collection = new Questions()
      collection.fetch(
        success: (collection) ->
          deferred.resolve collection.models
      )

      deferred.promise
