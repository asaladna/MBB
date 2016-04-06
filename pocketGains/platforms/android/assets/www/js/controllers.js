angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {
    
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
  $ionicSlideBoxDelegate.enableSlide(false);

  $scope.disableSlide = function() {
    $ionicSlideBoxDelegate.enableSlide(false);
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

  $scope.workouts = [ ];

  $http.get(apiLink + "/workout/", { params: {"type": "arms" } })
    .success(function(data) {
        $scope.workouts = data;
        console.log(data);
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + data);
    });

  $ionicModal.fromTemplateUrl('templates/workoutSelector-modal.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal;
  })

  $scope.openModal = function(category) {
    $scope.category = category;
    console.log(category + " category selected!")
    $scope.modal.show();
  }

  $scope.selectFavWorkout = function(id) {
    console.log("User selected workout with id: " + id + " from the " + $scope.category + " category");
    $scope.modal.hide();
  }
})
  
  

.controller('SignInCtrl', function($scope,$state, $http) {
  
    $scope.form = {};

    $scope.createAcc= function(){
        $state.go('app.profileBuilder');
    }
    
    $scope.login = function($event) {
        var params= {}
        if($scope.form.username){
            params.username=$scope.form.username;
        }
        if($scope.form.password){
            params.password=$scope.form.password;
        }


      var apiLink = "http://private-1b0f9-pocketgains.apiary-mock.com/login/"
      $scope.workouts = [ ];

      $http.post(apiLink, {params: {"username": params.username, "passowrd": params.password} })
        .success(function(data) {
            $scope.workouts = data;
            console.log(data);
        })
        .error(function(data) {
            alert("API ERROR at " + apiLink + "\n" + data);
        });

      console.log("Started from the bottom")


    }
})

.controller('HomeTabCtrl', function($scope) {
  console.log('HomeTabCtrl');
})



