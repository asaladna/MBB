<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// Routes
// Creates an acccount and adds it to the database
$app->post('/createNewUser', function ($request, $response, $args) {
    try
    {
    	// assumes fields aren't left blank and contain proper information from client side
    	$db = $this->api_login;

    	$params = $request->getParsedBody();
    	$username = $params['username'];
    	$password = $params['password'];
    	$sex = $params['sex'];
    	$goal = $params['goal'];
    	$cardioPref = $params['cardioPref'];
    	$exp = 0;
    	$fav_arm_id = $params['arms'];
    	$fav_leg_id = $params['legs'];
    	$fav_back_id = $params['back'];
    	$fav_shoulder_id = $params['shoulders'];
    	$fav_chest_id = $params['chest'];

    	// hash and salt password using bcrypt
    	$password = password_hash($password, PASSWORD_BCRYPT);

    	// check connection to db
    	if ($db)
    	{
    		// check if username is taken
    		$query = $db->prepare("SELECT username from User WHERE username = :username LIMIT 1");
    		$query->execute(array('username' => $username));

    		// username is not in use
    		if ($query->rowCount() == 0)
    		{
    			// insert user info into db
    			$query = $db->prepare("INSERT into User (username, password, sex, goal, cardioPref,
    				exp) values ('$username', '$password', '$sex', '$goal', '$cardioPref', $exp)");
    			$query->bindParam(':username', $username);
    			$query->bindParam(':password', $password);
    			$query->bindParam(':sex', $sex);
    			$query->bindParam(':goal', $goal);
    			$query->bindParam('cardioPref', $cardioPref);
    			$query->bindParam(':exp', $exp);
    			$query->execute();
    		}
    		else
    			throw new PDOException("error creating an account");

    		// get user_id to add preferred workouts to db
    		$query = $db->prepare("SELECT user_id from User WHERE username = :username LIMIT 1");
    		$query->execute(array('username' => $username));
    		$result = $query->fetch();

    		// insert preferred workouts for the new account if the account was sucessfully created
    		if ($result)
    		{
                $user_id = $result['user_id'];

    			// add preferred arm workout
                $query = $db->prepare("INSERT into Faved_Workouts (Workout_workout_id, User_user_id)
                    values ($fav_arm_id, $user_id)");
    			$query->bindParam('fav_arm_id', $fav_arm_id);
    			$query->bindParam('$user_id', $user_id);
    			$query->execute();

    			// add preferred leg workout
    			$query = $db->prepare("INSERT into Faved_Workouts (Workout_workout_id, User_user_id)
    				values ($fav_leg_id, $user_id)");
    			$query->bindParam('fav_leg_id', $fav_leg_id);
    			$query->bindParam('$user_id', $user_id);
    			$query->execute();

    			// add preferred back workout
    			$query = $db->prepare("INSERT into Faved_Workouts (Workout_workout_id, User_user_id)
    				values ($fav_back_id, $user_id)");
    			$query->bindParam('fav_back_id', $fav_back_id);
    			$query->bindParam('$user_id', $user_id);
    			$query->execute();

    			// add preferred shoulder workout
    			$query = $db->prepare("INSERT into Faved_Workouts (Workout_workout_id, User_user_id)
    				values ($fav_shoulder_id, $user_id)");
    			$query->bindParam('fav_shoulder_id', $fav_shoulder_id);
    			$query->bindParam('$user_id', $user_id);
    			$query->execute();

    			// add preferred chest workout
    			$query = $db->prepare("INSERT into Faved_Workouts (Workout_workout_id, User_user_id)
    				values ($fav_chest_id, $user_id)");
    			$query->bindParam('fav_chest_id', $fav_chest_id);
    			$query->bindParam('$user_id', $user_id);
    			$query->execute();
    		}
    		else
                throw new PDOException("\"error adding preferred workouts\"");
    	}
    	else
    		throw new PDOException("\"error creating an account\"");
    }
    catch (PDOException $e)
    {
    	echo $e->getMessage();
    }
});
// Queries db to see if entered credentials are correct
// logs user in if proper credentials entered, returns error message if not
// Queries db to see if entered credentials are correct
// logs user in if proper credentials entered, returns error message if not
$app->post('/login', function ($request, $response, $args) {
    // assumes fields aren't blank from client side
    // also assumes that the user has not logged in recently (session expired)
    try
    {
        // connect to pocketgains db
        $db = $this->api_login;
        
        $params = $request->getParsedBody();
        $username = $params['username'];
        $password = $params['password'];

        if ($db)
        {
            // grab username and password from db
            $query = $db->prepare("SELECT username, password FROM User WHERE username = :username
                LIMIT 1");
            $query->execute(array('username' => $username));
            
            // ensures one result is returned
            if ($query->rowCount() == 1)
            {
                //retrieve query results
                $result = $query->fetchAll();
                $hash = "";
                
                foreach($result as $row)
                    $hash = $row['password'];
                
                // verify passwords match
                if (hash_equals($password, $hash))
                {
                    // create a new session for the user and store session id in db
                    session_start();
                    $session_id = session_id();
                    // assign the username to the session
                    $_SESSION['username'] = $username;
                    
                    // add session id to db for the logged in user
                    $query = $db->prepare("UPDATE User SET session_id = :session_id
                        WHERE username = :username");
                    $query->execute(array('session_id' => $session_id, 'username' => $username));
                }
                else
                    throw new PDOException("\"invalid username or password\"");
            }
            else
                throw new PDOException("\"invalid username or password\"");
        }
        else
            throw new PDOException("\"could not connect to db\"");
    }
    catch (PDOException $e)
    {
        echo $e->getMessage();
    }
});
$app->get('/achievements',
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
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
        echo "\"There was an error\"";
    }
});
$app->get('/achievements/{user_id}',
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
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
        echo "\"There was an error\"";
    }
});
$app->post('/completedAchievement',
    function ($request, $response, $args) {
      try {
        $db = $this->api_login;
        $parms = $request->getParsedBody();
        $uid = $parms['user_id'];
        $aid = $parms['achieve_id'];
        $query = $db->prepare("INSERT INTO Achievements_Completed (User_user_id, Achievements_achieve_id)
                    VALUES ($uid, $aid)");
        $query->bindParam(':user_id', $uid);
        $query->bindParam(':achieve_id', $aid);
        $query->execute();
        echo "\"Completed Achievement Added.\"";
      }
      catch(PDOException $e) {
          echo "\"There was an error\"";
      }
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
        echo "\"There was an error\"";
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
        $query->bindParam(':user_id', $uid);
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
        echo "\"There was an error\"";
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
        echo "\"There was an error\"";
    }
});
$app->get('/favorites/{user_id}',
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;
        $query = $db->prepare(
            'SELECT DISTINCT f.Workout_workout_id AS id, w.title, f.reps, f.sets, f.weight, f.duration
                FROM Faved_Workouts f, User u, Is_Type it, Types t, Workout w
                WHERE :user_id = u.user_id
                AND u.user_id = f.User_user_id
                AND f.Workout_workout_id = w.workout_id;'
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
        echo "\"There was an error\"";
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
        echo "\"There was an error\"";
    }
});
$app->post('/userData',
    function ($request, $response, $args) {
    try {
			$db = $this->api_login;
			$user_id = $_POST['user_id'];
			$query = $db->prepare(
			'SELECT u.username, u.exp, u.cardioPref, p.arms, p.legs, p.chest, p.back, p.shoulders, p.cardio
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
				echo "\"There was an error\"";
		}
});
$app->post('/addCompletedWorkout',
    function ($request, $response, $args) {
			$db = $this->api_login;
			$user_id = $_POST['user_id'];
			$workout_id = $_POST['workout_id'];
			$sets = $_POST['sets'];
			$reps = $_POST['reps'];
			$weight = $_POST['weight'];
			$duration = $_POST['duration'];
      try {
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
      echo "\"Workout Added.\"";
    }
    catch(PDOException $e) {
        echo "\"There was an error\"";
    }
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
	        echo "\"There was an error\"";
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
    try {
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
    echo "\"Favorite Added.\"";
  }
  catch(PDOException $e) {
      echo "\"There was an error\"";
  }
});
$app->get('/getHistory/{user_id}/{start}/{end}',
    function ($request, $response, $args) {
			try {
			$db = $this->api_login;
			$start = $args['start'];
			$end = $args['end'];
			$uid = $args['user_id'];
			$query = $db->prepare(
					"SELECT w.title, w.desc, h.time_stamp, h.duration, h.reps, h.sets, h.weight
             FROM Workout_History AS h RIGHT JOIN Workout w
               ON h.Workout_workout_id = w.workout_id
						WHERE h.User_user_id = :user_id
							AND h.time_stamp > :start
							AND h.time_stamp < $end"
			);
			$query->bindParam(':user_id', $uid);
			$query->bindParam(':start', $start);
			//$query->bindParam(':end', $end);
			$query->execute();
			$arr = $query->fetchAll(PDO::FETCH_ASSOC);
			if($arr) {
					return $response->write(json_encode($arr));
					$db = null;
			}
      else {
					throw new PDOException("\"No records found.\"");
			}
	}
	catch(PDOException $e) {
			echo $e->getMessage();
		}
});
// Displays a list of all the workouts for a particular workout type
$app->get('/workouts/{type}', function ($request, $response, $args) {
    // get type id
    $type = $args['type'];
    try
    {
        // connect to pocketgains db;
        $db = $this->api_login;
        if ($db)
        {
            $query = $db->prepare("SELECT w.workout_id, w.title, w.desc
                FROM (Workout w LEFT JOIN Is_Type i
                     ON w.workout_id = i.Workout_workout_id)
              LEFT JOIN Types t
                     ON i.Types_type_id = t.type_id
                WHERE t.name = :type AND i.Workout_workout_id = w.workout_id");
            $query->execute(array('type' => $type));
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            if ($result)
            {
                return $response->write(json_encode($result));
            }
            else
                throw new PDOException("no results found");
        }
        else
            throw new PDOException("could not connect to db");
    }
    catch (PDOException $e)
    {
        echo "\"There was an error\"";
    }
});
// Displays the workout id, title, desc, and type of a particular workout
$app->get('/workout/{workout_id}', function ($request, $response, $args) {
    // get workout id
    $workout_id = $args['workout_id'];
    try
    {
        // connect to pocketgains db
        $db = $this->api_login;
        if ($db)
        {
            $query = $db->prepare("SELECT w.workout_id, w.title, w.desc, t.name
                FROM Workout w, Types t, Is_Type i WHERE w.workout_id = :workout_id
                AND i.Workout_workout_id = :workout_id AND i.Types_type_id = t.type_id");
            $query->execute(array('workout_id' => $workout_id, 'workout_id' => $workout_id));
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            if ($result)
            {
                return $response->write(json_encode($result));
            }
            else
                throw new PDOException("no results found");
        }
        else
            throw new PDOException("could not connect to db");
    }
    catch (PDOException $e)
    {
        echo "\"There was an error\"";
    }
});
// Displays the workout history of the logged in user
$app->get('/getHistory/{user_id}/{start}', function ($request, $response, $args) {
    // get user id
    $user_id = $args['user_id'];
    try
    {
        // connect to pocketgains db
        $db = $this->api_login;
        if ($db)
        {
					$start = $args['start'];
					$uid = $args['user_id'];
					$query = $db->prepare(
							"SELECT w.title, w.desc, h.time_stamp, h.duration, h.reps, h.sets, h.weight
								 FROM Workout_History AS h RIGHT JOIN Workout w
								 	 ON h.Workout_workout_id = w.workout_id
								WHERE h.User_user_id = :user_id
									AND h.time_stamp > :start"
					);
					$query->bindParam(':user_id', $uid);
					$query->bindParam(':start', $start);
					$query->execute();
            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            if ($result)
            {
                return $response->write(json_encode($result));
            }
            else
                throw new PDOException("\"no results found\"");
        }
        else
            throw new PDOException("\"could not connect to db\"");
    }
    catch (PDOException $e)
    {
        echo $e->getMessage();
    }
});
$app->post('/editFavorite',
    function ($request, $response, $args) {
		$db = $this->api_login;
		$user_id = $_POST['user_id'];
		$workout_id = $_POST['workout_id'];
		$weight = $_POST['weight'];
		$sets = $_POST['sets'];
		$reps = $_POST['reps'];
		$duration = $_POST['duration'];
    try {
		$query = $db->prepare(
		"UPDATE Faved_Workouts
		    SET Workout_workout_id = :workout_id, weight = :weight, sets = :sets,
            reps = :reps, duration = :duration
      WHERE Workout_workout_id = :workout_id
  			AND User_user_id = :user_id"
		);
		$query->execute(
				array(
					'user_id' => $user_id, 'workout_id' => $workout_id, 'weight' => $weight,
					'sets' => $sets, 'reps' => $reps, 'duration' => $duration
				)
		);
    echo "\"Favorite Edited\"";
  }
  catch (PDOException $e)
  {
      echo "\"There was an error\"";
  }
});
?>
