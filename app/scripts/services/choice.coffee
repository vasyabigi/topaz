'use strict'

angular.module('topazApp')
  .factory 'Choice', ($q)->
    Choice = Parse.Object.extend(
      className: 'Choice'

      getUser: -> @get 'user'

      getQuestion: -> @get 'question'
    )

    model: Choice

    Choices = Parse.Collection.extend(
      model: Choice

      comparator: (model) ->
        -model.createdAt.getTime()

      query: ->
        new Parse.Query('Choice')

      forQuestion: (question) ->
        # Find all choices for specific question
        @query().equalTo("question", question).include(["user"]).find().then((choices) =>
          # Add each choice to current collection
          _.each choices, (choice) =>
            @add choice
        )
    )

    model: Choice
    collection: Choices
