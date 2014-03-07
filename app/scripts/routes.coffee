
angular.module('topazApp').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->

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

    .state 'app.question',
      url: '/question'
      templateUrl: 'views/question.html'

    .state 'app.topazes',
      url: '/topazes'
      templateUrl: 'views/topazes.html'

  return angular;
];
