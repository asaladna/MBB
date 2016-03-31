<?php
// Routes

// index page
$app->get('/', function ($request, $response, $args) {
    // can change return files/endpoints as needed    
    return $this->renderer->render($response, 'index.html', $args);
});

// Create account page
$app->get('/createNewUser', function ($request, $response, $args) {
    // can change return files/endpoints as needed
    return $this->renderer->render($response, 'createaccount.html', $args);
});

// Creates an acccount and adds it to the database then takes the user
// to the login page
$app->post('/login', function ($request, $response, $args) {
        
    // assumes fields aren't left blank and contain proper information from client side
    if (isset($_POST['submit']))
    {
        // retrieve user information from html page
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];

        // protect against sql injection using stripslashes and parameterized queries
        $username = stripslashes($username);
        $email = stripslashes($email);
        $password = stripslashes($password);

        // hash and salt password using bcrypt
        $password = password_hash($password, PASSWORD_BCRYPT);

        // connect to pocketgains database
        $db = $this->dbConn;

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
                $query = $db->prepare("INSERT into User (username, email, password, user_level,
                        exp) values (:username, :email, :password, :level, :exp)");
                $query->execute(array('username' => $username, 'email' => $email, 'password' =>
                        $password, 'level' => 1, 'exp' => 0));
                
                // can change return files/endpoints as needed
                // take user to login page
                return $this->renderer->render($response, 'login.html', $args);
            }
        }
    }                
});

$app->get('/achievements', 
	function ($request, $response, $args) {
    try {
    	$db = $this->api_login;
 
 		//FIX SQL STATEMENT FOR NEWLY UPDATED DB
        $query = $db->prepare("SELECT * FROM Achievements");
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
        $query = $db->prepare("SELECT * ");
        //$query->execute(array('user_id' => ));

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

$app->get('/completedAchievement', 
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