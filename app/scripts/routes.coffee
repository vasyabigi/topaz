angular.module('topazApp')
.config ($stateProvider, $urlRouterProvider)->

  $urlRouterProvider.otherwise '/app/main'

  $stateProvider
    .state 'app',
      url: '/app'
      abstract: true
      templateUrl: 'views/base.html'
      controller: 'MainCtrl'

    .state 'app.main',
      url: '/main'
      templateUrl: 'views/main.html'

    .state 'app.details',
      url: '/question/:id'
      templateUrl: 'views/question-details.html'
      controller: 'QuestionDetailsCtrl'
      resolve:
        currentQuestion: (Question, $stateParams)->
          questionQuery = new Parse.Query(Question.model)
          questionQuery.get($stateParams.id)
    .state 'app.results',
      url: '/question/:id/results'
      controller: 'QuestionResultsCtrl'
      templateUrl: 'views/question-results.html'
      resolve:
        results: ->
          'PIZDA'

.run ($rootScope, $state, User)->
  publicRoutes = ['app.main']
  $rootScope.$on '$stateChangeStart', (event, toState, toParams)->
    if not User.isAuth()
      if not _.contains(publicRoutes, toState.name)
        console.warn 'Login first (СУКА ЗАЛОГИНСЯ)!!!'
        event.preventDefault()
        $state.go 'app.main'
