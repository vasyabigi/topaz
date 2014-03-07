
angular.module('topazApp').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->

  $urlRouterProvider.otherwise('/app');

  $stateProvider
    .state('app', {
      url: '/app',
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })

    # .state('app.login', {
    #   url: '/login',
    #   views: {
    #     'planContent': {
    #       templateUrl: 'views/login.html'
    #     }
    #   }
    # })
  return angular;
];
