<?php

header('Access-Control-Allow-Origin: *');  
// Routes

$app->get('/test', function ($request, $response, $args) {
	return $response->write("Welcome to pocketgains");
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
        else {
            throw new PDOException('No records found.');
        }
 
    } catch(PDOException $e) {
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
 
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
});

$app->post('/completedAchievement', 
	function ($request, $response, $args) {
        $db = $this->api_login;
    
        $parms = $request->getParsedbody();
        if ($parms) {
            echo "Has  already parsed body";
        }
        else if(!$parms) {
            echo "Has no body";
        }
        else {
            echo "Why am I here?";
        }

        echo gettype($parms['User_user_id']);
        echo gettype($parms['Achievements_achieve_id']);
        echo($parms['User_user_id']);
        echo($parms['Achievements_achieve_id']);

        $statement = $db->prepare(
            'INSERT INTO Achievements_Completed (User_user_id, Achievements_achieve_id)
                VALUES (:user, :pass);');
        $statement->execute(
            array(
                'user' => $parms['User_user_id'],
                'pass' => $parms['Achievements_achieve_id']
                )
            );

        echo "Should have run the sql";
});

$app->get('/leaderboards', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		//FIX SQL STATEMENT FOR NEWLY UPDATED DB1111
        $query = $db->prepare(/*SQL STATEMENT GOES HERE*/);
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

$app->get('//userPoints/{user_id}', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		//FIX SQL STATEMENT FOR NEWLY UPDATED DB
        $query = $db->prepare(/*SQL STATEMENT GOES HERE*/);
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
?>
