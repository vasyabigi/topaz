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
        questionData: (Question, $state, $q, $stateParams)->
          defer = $q.defer()
          Question.get($stateParams.id).then(
            (data)->
              defer.resolve data
            (err)->
              defer.reject(err)
              $state.go 'app.main'
          )
          defer.promise;

    .state 'app.create',
      url: '/create'
      templateUrl: 'views/question-create.html'
      controller: 'QuestionCreateCtrl'

    .state 'app.results',
      url: '/question/:id/results'
      templateUrl: 'views/question-results.html'

.run ($rootScope, $state, User)->
  publicRoutes = ['app.main']
  $rootScope.$on '$stateChangeStart', (event, toState, toParams)->
    if not User.isAuth()
      if not _.contains(publicRoutes, toState.name)
        console.warn 'Login first!!!'
        event.preventDefault()
        $state.go 'app.main'

