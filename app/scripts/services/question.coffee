'use strict'

angular.module('topazApp')
  .factory 'Question', ($q)->
    Question = Parse.Object.extend(
      className: 'Question'
      getTitle: -> @get 'title'
    )

    Questions = Parse.Collection.extend
      model: Question

    collection = new Questions()

    create: (title) ->
      deferred = $q.defer()

      model = new Question()
      model.save({title: title},
        success: (object) ->
          deferred.resolve object
      )
      collection.add({title: title})
      deferred.promise

    all: ->
      deferred = $q.defer()

      collection.fetch(
        success: (collection) ->
          deferred.resolve collection.models
      )

      deferred.promise

    get: (id) ->
      query = new Parse.Query(Question)
      query.get(id)

    model: Question
