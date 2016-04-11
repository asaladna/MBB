<?php

header('Access-Control-Allow-Origin: *');  
// Routes

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

        $query = $db->prepare(
            'SELECT u.user_id, u.username, cardio AS points
                FROM User u
                LEFT JOIN Points p
                ON u.user_id = p.User_user_id
                GROUP BY cardio                
                DESC LIMIT 10');
        $query->execute(
            array(
                'type' => $args['type']
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

$app->get('/getLeaderboardUser/{user_id}/{type}', 
    function ($request, $response, $args) {
    try {
        $db = $this->api_login;
 
        $query = $db->prepare(
            'SELECT COUNT(:type) + 1 AS place
                FROM (
                    SELECT u.user_id, u.username, :type
                    FROM User u 
                    LEFT JOIN Points p
                    ON u.user_id = p.User_user_id
                    GROUP BY :type 
                    DESC) AS A
                WHERE :type > (
                    SELECT DISTINCT (:type) 
                    FROM User u
                    LEFT JOIN Points p
                    ON 1 = p.User_user_id
                    ORDER BY (:type));'
            );
        $query->execute(
            array(
                    'user_id' => $args['user_id'],
                    'type' => $args['type']
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
            'SELECT DISTINCT f.fav_id, f.Workout_workout_id, f.reps, f.sets, f.weight, f.duration
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
			$title = $_POST['title'];
			$sets = $_POST['sets'];
			$reps = $_POST['reps'];
			$weight = $_POST['weight'];
//			$desc = $_POST['desc'];
			$duration = $_POST['duration'];


/*
			//TEST CASE HARDCODED TEST USER
			$user_id = 12;
			$title = "Humbug";
			$sets = 1;
			$reps = 15156;
			$weight = 9001;
			$duration = NULL;
*/

			$query = $db->prepare(
			"INSERT INTO Workout_History(User_user_id, title, sets, reps, weight,
									 duration) VALUES (:user_id, :title, :sets, :reps, :weight,
									 :duration)"
			);
			$query->execute(
					array(
							'user_id' => $user_id, 'title' => $title, 'sets' => $sets,
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
