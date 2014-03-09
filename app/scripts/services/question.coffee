'use strict'

angular.module('topazApp')
  .factory 'Question', ($q)->
    Question = Parse.Object.extend(
      className: 'Question'

      getTitle: ->
        @get 'title'
    )

    Questions = Parse.Collection.extend
      model: Question

      comparator: (model) ->
        -model.createdAt.getTime()

      query: ->
        new Parse.Query("Question").descending("createdAt")

      addQuestion: (data) ->
        question = new Question()
        question.save(data).then((response) =>
          @add data
        )

      removeQuestion: (question) ->
        return false unless @get(question)
        question.destroy().then =>
          @remove question

    model: Question
    collection: Questions
