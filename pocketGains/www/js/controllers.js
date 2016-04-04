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

  // Data to be sent to API
  $scope.sex = "n";
  $scope.goal = "n";
  $scope.favs = [ ];

  // This is for when a workout button is clicked to show user 
  // which types they have already selected a workout for
  $scope.isActivated = false;

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
    $scope.sex = "Male";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectFemale = function() {
    console.log("Female selected!");
    $scope.sex = "Female";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectScale = function() {
    console.log("Lose Weight selected!");
    $scope.goal = "Lose Weight";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectMuscle = function() {
    console.log("Build Muscle selected!");
    $scope.goal = "Build Muscle";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectAthletics = function() {
    console.log("Improve Athletics selected!");
    $scope.goal = "Improve Athletics";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectRunning = function() {
    console.log("Running selected!");
    $scope.favs["cardio"] = "Running";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectCycling = function() {
    console.log("Cycling selected!");
    $scope.favs["cardio"] = "Cycling";
    $ionicSlideBoxDelegate.next();
  }

  $scope.selectSwimming = function() {
    console.log("Swimming selected!");
    $scope.favs["cardio"] = "Swimming";
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

    if (category == "arms") {
      $scope.armsInteracted = "workout-selector-interacted";
    } else if (category == "legs") {
      $scope.legsInteracted = "workout-selector-interacted";
    } else if (category == "back") {
      $scope.backInteracted = "workout-selector-interacted";
    } else if (category == "shoulders") {
      $scope.shouldersInteracted = "workout-selector-interacted";
    } else if (category == "chest") {
      $scope.chestInteracted = "workout-selector-interacted";
    }


    // If all the categorys have a selection, show the next button
    if ($scope.armsInteracted == "workout-selector-interacted" &&
        $scope.legsInteracted == "workout-selector-interacted" &&
        $scope.backInteracted == "workout-selector-interacted" &&
        $scope.shouldersInteracted == "workout-selector-interacted" &&
        $scope.chestInteracted == "workout-selector-interacted") {
      $scope.nextText = "Next";
    }
    
  }

  $scope.selectFavWorkout = function(id, title) {
    console.log("User selected workout with id: " + id + " from the " + $scope.category + " category");
    $scope.favs[$scope.category] = id;
    $scope.modal.hide();
  }

  $scope.profileBuilderFinish = function() {
    $http.post(apiLink + "/createNewUser", 
      [
        {
          "user_id": 23, // provided from login.html
          "username": "A", // provided from login.html
          "password": "abc", // provided from login.html
          "sex": $scope.sex,
          "goal": $scope.goal,
          "arms": $scope.favs["arms"],
          "legs": $scope.favs["legs"],
          "back": $scope.favs["back"],
          "shoulders": $scope.favs["shoulders"],
          "chest": $scope.favs["chest"],
          "cardio": $scope.favs["cardio"],
          "cardioPref": 2 // What is this?
        }
      ]
    )
    .success(function(data) {
        $scope.profileBuilderResponse = data;
        console.log(data);
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + data);
    });
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



