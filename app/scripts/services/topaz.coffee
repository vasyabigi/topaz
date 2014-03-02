'use strict'

angular.module('topazApp')
  .factory 'Topaz', ->
    Topaz = Parse.Object.extend(
      className: "Topaz"

      getName: ->
        @get('name')

      getUser: ->
        @get('user')
    )

    Topazes = Parse.Collection.extend(
      model: Topaz

      comparator: (model) ->
        -model.createdAt.getTime()

      query: ->
        new Parse.Query("Topaz").descending("createdAt")

      addTopaz: (data) ->
        topaz = new Topaz()
        topaz.save(data).then((response) =>
          @add data
        )

      removeTopaz: (topaz) ->
        return false unless @get(topaz)
        topaz.destroy().then =>
          @remove topaz
    )

    model: Topaz
    collection: Topazes
