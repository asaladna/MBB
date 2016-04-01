angular.module('starter.controllers', [])

//.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
//    
//  // Form data for the login modal
//  $scope.loginData = {};
//
//  // Create the login modal that we will use later
//  $ionicModal.fromTemplateUrl('templates/login.html', {
//    scope: $scope
//  }).then(function(modal) {
//    $scope.modal = modal;
//  });
//
//  // Triggered in the login modal to close it
//  $scope.closeLogin = function() {
//    $scope.modal.hide();
//  };
//
//  // Open the login modal
//  $scope.login = function() {
//    $scope.modal.show();
//  };
//
//  // Perform the login action when the user submits the login form
//  $scope.doLogin = function() {
//    console.log('Doing login', $scope.loginData);
//
//    // Simulate a login delay. Remove this and replace with your login
//    // code if using a login system
//    $timeout(function() {
//      $scope.closeLogin();
//    }, 1000);
//  };
//    
//
//})
.factory('UserData', function(){                                          // This factory stores information as a singleton so multiple controllers can access it
  return {data: {}};
})

.controller('SignInCtrl', function($scope,$state, $http, UserData) {
  
    $scope.form = {};
    
    $scope.login = function() {
        var params= {}
        if($scope.form.username){
            params.user=$scope.form.user;
        }
        if($scope.form.password){
            params.pass=$scope.form.pass;

        }
        $http({
      method: 'Post',
      url: 'http://private-1b0f9-pocketgains.apiary-mock.com/login',               // the link to my proxy
      params: params                                                         // sets the GET params
        
        //item thumbnail

      
    }).then(function successCallback(response) {
      UserData.data = response.data;                                      // save the response data in the factory
//       $state.go('app.beers');                                             // go to the beer results state
    });
        
        
//        console.log("LOGIN user: " + $scope.data.username + " - PW: " + $scope.data.password);
    }
})

.controller('HomeTabCtrl', function($scope) {
  console.log('HomeTabCtrl');
})

.controller("ExampleController", function($scope) {
    $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
    $scope.series = ['Cardio', 'Weight'];
    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];
 
})


