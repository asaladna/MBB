angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
    

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
    

})

.controller('ProfBuilderCtrl', function($scope, $ionicSlideBoxDelegate, $ionicSideMenuDelegate, $ionicModal, $http) {

  $ionicSideMenuDelegate.canDragContent(false);
  $ionicSlideBoxDelegate.enableSlide(0);

  $scope.disableSlide = function() {
    $ionicSlideBoxDelegate.enableSlide(0);
  };

  $scope.next = function() {
    $ionicSlideBoxDelegate.next();

  };

  $scope.slideChanged = function(index) {
    $scope.slideIndex = index;
  };

  $scope.selectMale = function() {
    console.log("Male selected!");
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectFemale = function() {
    console.log("Female selected!");
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectScale = function() {
    console.log("Lose Weight selected!");
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectMuscle = function() {
    console.log("Build Muscle selected!");
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectRunning = function() {
    console.log("Improve Athletics selected!");
    $ionicSlideBoxDelegate.next();
  }

  // Modal for selecting fav workout for each category
  var apiLink = "http://private-9f4a2-pocketgains.apiary-mock.com"

  $scope.items = [
      {
        id: '1',
        name: 'Pick up apples',
        done: false
      },
      {
        id: '2',
        name: 'Mow the lawn',
        done: true
      }
    ];

  $http.get(apiLink + "/achievements", { params: { } })
    .success(function(data) {
        $scope.items = data;
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + data);
    });

  $ionicModal.fromTemplateUrl('templates/workoutSelector-modal.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal
  })

  $scope.openModal = function() {
    $scope.modal.show()
  }

})

.controller("ExampleController", function($scope) {
    $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
    $scope.series = ['Cardio', 'Weight'];
    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];
 
});


