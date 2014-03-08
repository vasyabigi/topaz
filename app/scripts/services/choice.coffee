'use strict'

angular.module('topazApp')
  .factory 'Choice', (Question, $q)->
    Choice = Parse.Object.extend(
      className: 'Choice'

      getQuestion: -> @get 'question'

      getUser: -> @get 'user'
    )

    model: Choice

    Choices = Parse.Collection.extend(
      model: Choice

      comparator: (model) ->
        -model.createdAt.getTime()

      query: ->
        new Parse.Query('Choice')

      forQuestion: (question) ->
        q = new Question.model()
        q.id = question.objectId
        @query().equalTo("question", q).find()
    )

    model: Choice
    collection: Choices
