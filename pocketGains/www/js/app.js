// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
	
angular.module('starter', ['ionic', 'starter.controllers', 'chart.js', 'ui.router'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

    .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

  .state('app.dashboard', {
    url: '/dashboard',
    views: {
      'menuContent': {
        templateUrl: 'templates/dashboard.html',
        controller: 'AppCtrl'
      }
    }
  })

  .state('app.profileBuilder', {
      url: '/profileBuilder',
      views: {
        'menuContent': {
          templateUrl: 'templates/profileBuilder.html',
          controller: 'ProfBuilderCtrl'
        }
      }
    })

  .state('app.achievements', {
      url: '/achievements',
      views: {
        'menuContent': {
          templateUrl: 'templates/achievements.html'
        }
      }
    })

  .state('app.leaderboards', {
      url: '/leaderboards',
      views: {
        'menuContent': {
          templateUrl: 'templates/leaderboards.html'
        }
      }
    })
    .state('app.login', {
      url: '/login',
      views: {
        'menuContent': {
          templateUrl: 'templates/login.html',
            controller: 'SignInCtrl'
        }
      }
    })


  .state('app.help', {
      url: '/help',
      views: {
        'menuContent': {
          templateUrl: 'templates/help.html'
        }
      }
    })

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/dashboard');
});
