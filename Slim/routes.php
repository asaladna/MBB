<?php

header('Access-Control-Allow-Origin: *');  
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// Routes

// Creates an acccount and adds it to the database then takes the user
// to the login page
$app->post('/createNewUser', function ($request, $response, $args) {
        
    // assumes fields aren't left blank and contain proper information from client side
    if (isset($_POST['submit']))
    {
        // retrieve user information from html page
        $username = $_POST['username'];
        $password = $_POST['password'];
        $sex = $_POST['sex'];
        $goal = $_POST['goal'];

        // protect against 1st order sql injection using stripslashes and parameterized queries
        $username = stripslashes($username);
        $password = stripslashes($password);
        $sex = stripslashes($sex);
        $goal = stripslashes($goal);

        // hash and salt password using bcrypt
        $password = password_hash($password, PASSWORD_BCRYPT);

        try
        {
            // connect to pocketgains database
            // change dbConn to api_login for testing server
            $db = $this->api_login;

            if ($db)
            {
                // check if username is taken
                $query = $db->prepare("SELECT username from User WHERE username = :username LIMIT 1");
                $query->execute(array('username' => $username));

                // username is not in use
                // need to figure out the way we want to display errors to the user
                if ($query->rowCount() == 0)
                {
                    // check if email is already in use
                    $query = $db->prepare("SELECT email from User WHERE email = :email LIMIT 1");
                    $query->execute(array('email' => $email));

                    // email is also not in use
                    if ($query->rowCount() == 0)
                    {
                        // insert user info into db    
                        $query = $db->prepare("INSERT into User (username, password, sex, goal, exp)
                            values (:username, :password, :sex, :goal, :exp)");
                        $query->execute(array('username' => $username, 'password' =>$password, 'sex' => $sex,
                            'goal' => $goal, 'exp' => 0));
                
                        // can change return files/endpoints as needed
                        // take user to login page
                        return $this->renderer->render($response, 'login.html', $args);
                    }
                    else
                        throw new PDOException("username or email already in use");
                }
                else
                    throw new PDOException("username or email already in use");
            }
            else
                throw new PDOException("could not connect to db");
        }
        catch (PDOException $e)
        {
            echo '{"error":{"text":' . $e->getMessage() .'}}';
        }
    }                
});

$app->get('/achievements', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		//FIX SQL STATEMENT FOR NEWLY UPDATED DB
        $query = $db->prepare(
            'SELECT * 
                FROM Achievements');
        $query->execute();

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else 
        {
            throw new PDOException('No records found.');
        }
 
    } 
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->get('/achievements/{user_id}', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		//FIX SQL STATEMENT FOR NEWLY UPDATED DB
        $query = $db->prepare(
            'SELECT a.achieve_id, a.name, a.desc
                FROM Achievements a, User u, Achievements_Completed ac
                WHERE u.user_id = :user_id
                AND u.user_id = ac.User_user_id
                AND ac.Achievements_achieve_id = a.achieve_id;');
        $query->execute(
            array(
                'user_id' => $args['user_id']
                )
            );

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } 
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->post('/completedAchievement', 
	function ($request, $response, $args) {
        $db = $this->api_login;
            
        $user_id = $_POST['User_user_id'];
        $achieve_id = $_POST['Achievements_achieve_id'];

        $query = $db->prepare("insert into Achievements_Completed (User_user_id, Achievements_achieve_id)
                    values (:user_id, :achieve_id)");
        $query->execute(array('user_id' => $user_id, 'achieve_id' => $achieve_id));
});

$app->get('/getLeaders/{type}', 
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;

        $type = $args['type'];

        $query = $db->prepare(
            "SELECT u.user_id, u.username, $type AS points
                FROM User u
                LEFT JOIN Points p
                ON u.user_id = p.User_user_id
                GROUP BY $type                
                DESC LIMIT 10;"
            );

        $query->bindParam(':type', $type);

        $query->execute();

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});
$app->get('/getLeaderboardUser/{user_id}/{type}', 
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;

        $uid = $args['user_id'];
        $type = $args['type'];
 
        $query = $db->prepare(
            "SELECT COUNT($type) + 1 AS rank
                FROM (
                    SELECT u.user_id, u.username, $type
                    FROM User u 
                    LEFT JOIN Points p
                    ON u.user_id = p.User_user_id
                    GROUP BY $type 
                    DESC) AS A
                WHERE $type > (
                    SELECT DISTINCT ($type) 
                    FROM User u
                    LEFT JOIN Points p
                    ON $uid = p.User_user_id
                    ORDER BY ($type));"
            );

        $query->bindParam('user_id', $uid);
        $query->bindParam(':type', $type);

        $query->execute();

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->get('/workout/{user_id}/{workout_id}', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		 $query = $db->prepare(
            'SELECT t.name, wh.time_stamp, wh.weight, wh.sets, wh.reps
                FROM User u, Workout_History wh, Workout w, Is_Type it, Types t
                WHERE u.user_id = :user_id
                AND :user_id = wh.User_user_id
                AND wh.Workout_workout_id = :workout_id
                AND :workout_id = w.workout_id
                AND w.workout_id = it.Workout_workout_id
                AND it.Types_type_id = t.type_id;'
            );
        $query->execute(
            array(
                'user_id' => $args['user_id'],
                'workout_id' => $args['workout_id']
                )
            );

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->get('/favorites/{user_id}', 
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;

        $query = $db->prepare(
            'SELECT DISTINCT f.fav_id, f.Workout_workout_id, w.title, f.reps, f.sets, f.weight, f.duration
                FROM Faved_Workouts f, User u, Is_Type it, Types t, Workout w
                WHERE :user_id = u.user_id
                AND u.user_id = f.User_user_id
                AND f.Workout_workout_id = w.workout_id
                AND w.workout_id = it.Workout_workout_id;'
            );
        $query->execute(
            array(
                'user_id' => $args['user_id']
                )
            );

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } 
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->get('/favoriteTypes/{fav_id}', 
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;

        $query = $db->prepare(
            'SELECT DISTINCT t.name
                FROM Faved_Workouts f, Is_Type it, Types t, Workout w
                WHERE :fav_id = f.fav_id
                AND f.Workout_workout_id = w.workout_id
                AND w.workout_id = it.Workout_workout_id
                AND it.Types_type_id = t.type_id;');
        $query->execute(
            array(
                'fav_id' => $args['fav_id']
                )
            );

        $arr = $query->fetchAll(PDO::FETCH_ASSOC);
 
        if($arr) {
            return $response->write(json_encode($arr));
            $db = null;
        } 
        else {
            throw new PDOException('No records found.');
        }
 
    } 
    catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->post('/userData',
    function ($request, $response, $args) {
    try {
			$db = $this->api_login;

			$user_id = $_POST['user_id'];

			//TEST CASE HARDCODED TEST USER
			//$user_id = 12;

			$query = $db->prepare(
			'SELECT u.username, u.exp, p.arms, p.legs, p.chest, p.back, p.shoulders, p.cardio
					FROM User as u LEFT JOIN Points as p
					ON u.user_id = p.User_user_id
					WHERE u.user_id = :user_id'
			);
			$query->execute(
					array(
							'user_id' => $user_id
						)
			);
			$arr = $query->fetchAll(PDO::FETCH_ASSOC);

			if($arr) {
					return $response->write(json_encode($arr));
					$db = null;
			}
			else {
					throw new PDOException('No records found.');
			}
		}
		catch(PDOException $e) {
				echo '{"error":{"text":'. $e->getMessage() .'}}';
		}
});

$app->post('/addCompletedWorkout',
    function ($request, $response, $args) {
			$db = $this->api_login;


			$user_id = $_POST['user_id'];
			$workout_id = $_POST['workout_id'];
//			$title = $_POST['title'];
			$sets = $_POST['sets'];
			$reps = $_POST['reps'];
			$weight = $_POST['weight'];
//			$desc = $_POST['desc'];
			$duration = $_POST['duration'];


/*
			//TEST CASE HARDCODED TEST USER
			$user_id = 12;
//			$title = "Humbug";
			$sets = 1;
			$reps = 15156;
			$weight = 9001;
			$duration = NULL;
*/

			$query = $db->prepare(
			"INSERT INTO Workout_History(User_user_id, Workout_workout_id, sets, reps, weight,
									 duration) VALUES (:user_id, :workout_id, :sets, :reps, :weight,
									 :duration)"
			);
			$query->execute(
					array(
							'user_id' => $user_id, 'workout_id' => $workout_id, 'sets' => $sets,
							'reps' => $reps, 'weight' => $weight, 'duration' => $duration
						)
			);
});

$app->get('/workoutTypes',
    function ($request, $response, $args) {
			try {
	    	$db = $this->api_login;


	        $query = $db->prepare(
	            'SELECT *
	                FROM Types');
	        $query->execute();
	        $arr = $query->fetchAll(PDO::FETCH_ASSOC);

	        if($arr) {
	            return $response->write(json_encode($arr));
	            $db = null;
	        }
	        else
	        {
	            throw new PDOException('No records found.');
	        }

	    }
	    catch(PDOException $e) {
	        echo '{"error":{"text":'. $e->getMessage() .'}}';
	    }
});

$app->post('/addFavorite',
    function ($request, $response, $args) {
		$db = $this->api_login;
		
		$user_id = $_POST['user_id'];
		$workout_id = $_POST['workout_id'];
		$weight = $_POST['weight'];
		$sets = $_POST['sets'];
		$reps = $_POST['reps'];
		$duration = $_POST['duration'];
/*
		//Test code
		$user_id = 12;
		$workout_id = 1;
		$weight = 120;
		$sets = 3;
		$reps = 12;
		$duration = NULL;
*/
		$query = $db->prepare(
		"INSERT INTO Faved_Workouts(User_user_id, Workout_workout_id, sets, reps, weight,
								 duration) VALUES (:user_id, :workout_id, :sets, :reps, :weight,
								 :duration)"
		);
		$query->execute(
				array(
						'user_id' => $user_id, 'workout_id' => $workout_id, 'weight' => $weight,
						'sets' => $sets, 'reps' => $reps, 'duration' => $duration
					)
		);

});

$app->get('/getHistoryWorkout/{user_id}/{hist_id}',
    function ($request, $response, $args) {
	try {
		$db = $this->api_login;

		$query = $db->prepare(
				'SELECT w.workout_id, w.title, h.time_stamp, h.duration, h.reps,
								h.sets, h.weight, w.desc
					 FROM (Workout_History AS h LEFT JOIN Workout AS w ON h.Workout_workout_id
					 = w.workout_id) RIGHT JOIN User AS u ON h.User_user_id = u.user_id
					WHERE u.user_id = :user_id
								AND h.hist_id = :hist_id'
		);
		$query->execute(
				array(
						'user_id' => $args['user_id'],
						'hist_id' => $args['hist_id']
						)
				);
		$arr = $query->fetchAll(PDO::FETCH_ASSOC);

		if($arr) {
				return $response->write(json_encode($arr));
				$db = null;
		}
		else {
				throw new PDOException('No records found.');
		}

		}
	catch(PDOException $e) {
			echo '{"error":{"text":'. $e->getMessage() .'}}';
	}

});

?>
