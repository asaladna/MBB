angular.module('starter.controllers', ["chart.js"])

.controller('AppCtrl', function($scope, userData, $http, $ionicModal, $ionicHistory) {
})

.controller('DashboardCtrl', function($scope, $state, userData, $http, $ionicModal, $ionicHistory,$stateParams, $ionicSlideBoxDelegate) {
    
  // User data
  $scope.username = userData.getUsername();
  $scope.user_id = userData.getId();

  $scope.firstAchievement = false;

  var apiLink = "http://52.37.226.62";

  $ionicModal.fromTemplateUrl('templates/completedAchievement-modal.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal;
  })

  $scope.openModal = function(achievement) {
    $scope.achievementTitle = achievement.name;
    $scope.achievementDesc = achievement.desc;
    $scope.modal.show();
  };

  $scope.closeModal = function() {
    $scope.modal.hide();
  };

  // ----- Get First achievement for creating account (gym rat) if not complete
  // Get list of completed achievements
  $http.get("http://private-9f4a2-pocketgains.apiary-mock.com" + "/achievements/" + $scope.user_id )
      .success(function(data) {
          $scope.compAchievements = data;

          console.log(data);

          for (i = 0; i < data.achievementsC.length; i++) {
            if(data.achievementsC[i].achieve_id == 65) {
              $scope.firstAchievement = true;
              console.log($scope.firstAchievement)
            }
          }

          // IF the user has not yet earned the Gym Rat achieve, give it to them
            console.log("achieve flag = " + $scope.firstAchievement)
            if ($scope.firstAchievement == false) {

              $http.get(apiLink + "/achievements", { } )
                .success(function(data) {

                    var gymRat_id = 65;

                    $scope.completedAchievement = data[gymRat_id];

                    //POST that achievement was completed
                    $http.post("http://private-9f4a2-pocketgains.apiary-mock.com" + "/completedAchievement", 
                          {
                            "user_id": $scope.user_id,
                            "achieve_id": gymRat_id
                          }
                      )
                      .success(function(data) {

                          console.log(data);

                          $scope.openModal($scope.completedAchievement);
                          
                      })
                      .error(function(data) {
                          alert("API ERROR at " + apiLink + "\n" + "");
                      });
                })
                .error(function(data) {
                    alert("API ERROR at " + apiLink + "\n" + "8");
                });
            }
      })
      .error(function(data) {
          alert("API ERROR at " + apiLink + "\n" + "7");
      });

  

  $scope.workoutDashClick = function() {
    $state.go('app.workoutDashboard');
  }
  
 $scope.leaders = function() {
    $state.go('app.leaderboards');
  } 
})








.controller('ProfBuilderCtrl', function($scope, userData, $state, $ionicHistory, $ionicSlideBoxDelegate, $ionicSideMenuDelegate, $ionicModal, $http) {

  var apiLink = "http://private-9f4a2-pocketgains.apiary-mock.com";

  $ionicSideMenuDelegate.canDragContent(false);
  $ionicSlideBoxDelegate.enableSlide(false);

  // Data to be sent to API
  $scope.sex = "n";
  $scope.goal = "n";
  $scope.favs = [ ];
  $scope.interacted = [ ];

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
  var apiLink = null;

  $scope.workouts = [ ];
  $scope.nextText = "none";

  $http.get("http://private-9f4a2-pocketgains.apiary-mock.com" + "/workouts/" + "arms")
    .success(function(data) {
        $scope.workouts = data;
        console.log(data);
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + "6");
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

  $scope.selectFavWorkout = function(id, title) {
    console.log("User selected workout with id: " + id + " from the " + $scope.category + " category");
    
    // Change color of workout selector button to indicate a workout has already been chosen
    if ($scope.category == "arms") {
      $scope.interacted["arms"] = "workout-selector-interacted";
    } else if ($scope.category == "legs") {
      $scope.interacted["legs"] = "workout-selector-interacted";
    } else if ($scope.category == "back") {
      $scope.interacted["back"] = "workout-selector-interacted";
    } else if ($scope.category == "shoulders") {
      $scope.interacted["shoulders"] = "workout-selector-interacted";
    } else if ($scope.category == "chest") {
      $scope.interacted["chest"] = "workout-selector-interacted";
    }

    // If all the categorys have a selection, show the next button
    if ($scope.interacted["arms"] == "workout-selector-interacted" &&
        $scope.interacted["legs"] == "workout-selector-interacted" &&
        $scope.interacted["back"] == "workout-selector-interacted" &&
        $scope.interacted["shoulders"] == "workout-selector-interacted" &&
        $scope.interacted["chest"] == "workout-selector-interacted") {
      $scope.nextText = "block";
    }

    $scope.favs[$scope.category] = id;
    $scope.modal.hide();
  }

  $scope.profileBuilderFinish = function() {
    $http.post(apiLink + "/createNewUser", 
        {
          "username": userData.getUsername(),
          "password": userData.getPassword(), 
          "sex": $scope.sex,
          "goal": $scope.goal,
          "arms": $scope.favs["arms"],
          "legs": $scope.favs["legs"],
          "back": $scope.favs["back"],
          "shoulders": $scope.favs["shoulders"],
          "chest": $scope.favs["chest"],
          "cardio": $scope.favs["cardio"]
        }
    )
    .success(function(data) {
        $scope.profileBuilderResponse = data;

        $ionicHistory.nextViewOptions({
          disableAnimate: true,
          disableBack: true
        });

        // Set the user_id for the entire app
        userData.setId(data.user_id);
        console.log(data.user_id);

        $state.go('app.dashboard');
        
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + data);
    });
  }


})
  
  

.controller('SignInCtrl', function($scope, $ionicHistory, $ionicModal, $ionicConfig, $ionicSideMenuDelegate, $state, $http, userData) {

    var apiLink = "http://private-9f4a2-pocketgains.apiary-mock.com";

    $scope.form = {};

    $ionicSideMenuDelegate.canDragContent(false);


    $scope.createAcc= function(){
      $scope.username = $scope.form.username;
      $scope.password = $scope.form.password;
      $scope.verifyPass = $scope.form.verifyPassword;

      console.log($scope.username);
      console.log($scope.password);
      console.log($scope.verifyPass);

      if ($scope.password == $scope.verifyPass) {
        userData.setUsername($scope.username);
        userData.setPassword($scope.password);
        $state.go('app.profileBuilder');
        $scope.modal.hide();
      } else {
        $scope.message = "Passwords do not match!";
      }

      
    }
    
    $scope.login = function() {
      if($scope.form.username){
          $scope.username=$scope.form.username;
      }
      if($scope.form.password){
          $scope.password=$scope.form.password;
      }

      $http.post(apiLink + "/login", 
            {
              "username": $scope.username, 
              "password": $scope.password
            }
        )
        .success(function(data) {

            $scope.user_id = data.user_id;

            userData.setUsername($scope.username);
            userData.setId($scope.user_id);

            console.log("User " + userData.getUsername() + " login success.");

            $ionicHistory.nextViewOptions({
              disableAnimate: true,
              disableBack: true
            });

            $state.go('app.dashboard');

        })
        .error(function(data) {
            $state.go('app.login');
            alert("API ERROR at " + apiLink + "\n" + "POST /login");
        });
    }

    // Modal for creating new account
    $ionicModal.fromTemplateUrl('templates/createAccount-modal.html', {
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.modal = modal;
    })

    $scope.openModal = function() {
      $scope.modal.show();    
    }
})

.controller('HomeTabCtrl', function($scope, userData, $http) {

  var apiLink = "http://private-9f4a2-pocketgains.apiary-mock.com";

  $scope.user_id = userData.getId();

  $http.post(apiLink + "/userData",
    {
      "user_id": $scope.user_id
    }
  )

  .success(function(data) {
      $scope.labels = ['Cardio', 'Legs', 'Arms', 'Back', 'Shoulders', 'Chest'];
      $scope.userPoints =  {
                      "arms": data["arms"],
                      "legs": data["legs"],
                      "back": data["back"],
                      "shoulders": data["shoulders"],
                      "chest": data["chest"],
                      "cardio": data["cardio"]
                    };

      $scope.data = [[$scope.userPoints.cardio, $scope.userPoints.legs, $scope.userPoints.arms, $scope.userPoints.back, $scope.userPoints.shoulders, $scope.userPoints.chest]];
      

  })
  .error(function(data) {
      alert("API ERROR" + "\n" + "POST userData");
  });

  

})

.controller('AchieveCtrl', function($scope, $http, userData) {

  var apiLink = "http://52.37.226.62";

  $scope.user_id = 2;//userData.getId();
  

  $http.get("http://52.37.226.62/achievements")
    .success(function(data) {
        $scope.achievements = data;

        $http.get(apiLink + "/achievements/" + $scope.user_id)
          .success(function(data) {
              $scope.compAchievements = data;

              // console.log($scope.compAchievements);

              // Give a lock icon to all achievements
              for (i = 0; i < $scope.achievements.length; i++) {
                $scope.achievements[i].image = "lock";
              }

              // Give the check mark to completed achievements
              for (i = 0; i < $scope.compAchievements.length; i++) {
                $scope.achievements[$scope.compAchievements[i].achieve_id - 1].image = "checkmark_icon";    
              }

              // console.log(data);
          })
          .error(function(data) {
              alert("API ERROR at " + apiLink + "\n" + 1);
          });
          //console.log(data[0].desc);
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + 2);
    });

  


})

            
.controller('LeaderCtrl', function($scope, $state, userData, $http) {
    //var apiLink = "http://private-1b0f9-pocketgains.apiary-mock.com";
    $scope.user_id = userData.getId();

    var apiLink = "http://52.37.226.62";


  $http.get(apiLink + "/workoutTypes")
          .success(function(data) {
              $scope.buttons = data;

              
          })
          .error(function(data) {
              alert("API ERROR at " + apiLink + "\n" + 1);
          });

    

})

.controller('WorkoutDashCtrl', function($scope, $http, userData, $ionicModal, $ionicHistory, $state, $ionicSlideBoxDelegate) {

  var apiLink = "http://private-9f4a2-pocketgains.apiary-mock.com";

  $scope.form = {};

  $scope.user_id = 1;//userData.getId();

  console.log($scope.typeButtons);

  // Get users suggested workouts
  $http.get(apiLink + "/getSuggestedWorkouts/" + $scope.user_id)
    .success(function(data) {
        $scope.suggestedWorkouts = data;
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + "WorkoutDashCtrl Suggested");
    });

  // Get users favorite workouts
  $http.get("http://52.37.226.62/favorites/" + $scope.user_id)
    .success(function(data) {
        $scope.favoriteWorkouts = data;
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + "WorkoutDashCtrl Favorites");
    });

   $http.get("http://52.37.226.62" + "/workoutTypes")
      .success(function(data) {
          $scope.workoutTypes = data;
          console.log(data);
          $scope.workoutTypes1 = data.slice(0,3);
          $scope.workoutTypes2 = data.slice(3,6);

      })
      .error(function(data) {
          alert("API ERROR at " + apiLink + "\n" + "6");
      });

    // Modal for active workout
    $ionicModal.fromTemplateUrl('templates/workoutActivity-modal.html', {
      id: '1',
      scope: $scope,
      animation: 'slide-in-left'
    }).then(function(modal) {
      $scope.modal = modal;
    })

    // Modal for selecting workout type
    $ionicModal.fromTemplateUrl('templates/typeSelector-modal.html', {
      id: '2',
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.typeModal = modal;
    })

    $scope.closeModal = function(index) {
      if (index == 1) {
        $scope.modal.hide();
      } else if (index == 2) {
        $scope.typeModal.hide();
      }
          
    }

    $scope.openModal = function(index, activeTitle, activeId) {
      if (index == 1) {
        $scope.activeWorkout = activeTitle;
        $scope.workoutId = activeId;
        $scope.modal.show();  
      } else if (index == 2) {
        $ionicSlideBoxDelegate.slide(0);
        // console.log("On slide #" + $ionicSlideBoxDelegate.currentIndex());
        $scope.typeModal.show();

      } 
    }

    $scope.submitWorkout = function(form) {
      $scope.user_id = userData.getId();
      $scope.workoutId = $scope.activeId;
      $scope.reps = $scope.form.reps;
      $scope.sets = $scope.form.sets;
      $scope.weight = $scope.form.weight;
      $scope.duration = null;

      $http.post("http://private-9f4a2-pocketgains.apiary-mock.com" + "/addCompletedWorkout", 
        {
          "user_id": $scope.user_id,
          "workout_id": $scope.workoutId,
          "sets": $scope.sets,
          "reps": $scope.reps,
          "weight": $scope.weight,
          "duration": $scope.duration
        }
      )
      .success(function(data) {
          $scope.addWorkoutResponse = data;
          console.log($scope.addWorkoutResponse)

          $ionicHistory.nextViewOptions({
            disableAnimate: true,
            disableBack: true
          });

          $scope.closeModal(2);
          $scope.closeModal(1);
          
      })
      .error(function(data) {
          alert("API ERROR at " + apiLink + "\n" + "POST /addCompletedWorkout" + "\n" + data);
      });
    }

    $scope.loadWorkouts = function(type) {
      $http.get("http://private-9f4a2-pocketgains.apiary-mock.com" + "/workouts/" + type)
        .success(function(data) {
            $scope.workouts = data;
            console.log(data);
        })
        .error(function(data) {
            alert("API ERROR at " + apiLink + "\n" + "6");
      });

      
    }
    
    
    
    $http.get(apiLink + "/workout/" + $scope.user_id)
    .success(function(workoutData) {
        $scope.items = workoutData;
        console.log($scope.items);
        $scope.items.push('Card ')
//      
//            for(var i = 0; i < 1000; i++) {
//              $scope.items.push('Card ' + i);
//        }
    })
    .error(function(data) {
        alert("API ERROR at " + apiLink + "\n" + "WorkoutDashCtrl Suggested");
    });
    
    
})


