
angular.module('topazApp').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

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
        questionId: ($stateParams)->
          return $stateParams.id

    .state 'app.create',
      url: '/create'
      templateUrl: 'views/question-create.html'
      controller: 'QuestionCreateCtrl'

    .state 'app.topazes',
      url: '/topazes'
      templateUrl: 'views/topazes.html'

  return angular
]
