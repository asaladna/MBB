<?php
// Routes

// index page
$app->get('/', function ($request, $response, $args) {
    // can change return files/endpoints as needed    
    return $this->renderer->render($response, 'createaccount.html', $args);
});

// Creates an acccount and adds it to the database then takes the user
// to the login page
$app->post('/createNewUser', function ($request, $response, $args) {
        
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

// need to work on sessions and error handling for the stuff that Wesley is working on
// Queries db to see if entered credentials are correct
// logs user in if proper credentials entered, returns error message if not
$app->post('/login', function ($request, $response, $args) {
    // assumes fields aren't blank from client side
    // also assumes that the user has not logged in recently (session expired)
    if (isset($_POST['login']))
    {
        // retreive user information from html page
        $username = $_POST['username'];
        $password = $_POST['password'];

        // protect against sql injection using stripslashes and parameterized queries
        $username = stripslashes($username);
        $password = stripslashes($password);

        // connect to pocketgains db
        // change dbConn to api_login for testing server
        $db = $this->dbConn;

        try
        {
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
                    if (password_verify($password, $hash))
                    {
                        // create a new session for the user and store session id in db
                        session_start();
                        $session_id = session_id();
                        // assign the username to the session
                        $_SESSION['username'] = $username;

                        $query = $db->prepare("UPDATE User SET session_id = :session_id
                            WHERE username = :username");
                        $query->execute(array('session_id' => $session_id, 'username' => $username));

                        // go to user dashboard
                        return $this->renderer->render($response, 'dashboard.html', $args);
                    }
                    else
                        throw new PDOException("invalid username or password");
                }
                else
                    throw new PDOException("invalid username or password");
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

// Displays a list of all the workouts for a particular workout type
$app->get('/workouts/{type}', function ($request, $response, $args) {
    // get type id
    $type = $args['type'];

    try
    {
        // connect to pocketgains db;
        // change dbConn to api_login for testing server
        $db = $this->dbConn;

        if ($db)
        {
            $query = $db->prepare("SELECT DISTINCT w.workout_id, w.title, w.desc FROM Workout w, Is_Type i
                WHERE i.Types_type_id = :type AND i.Workout_workout_id = w.workout_id");
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
        echo '{"error":{"text"' . $e->getMessage() . '}}';
    }    
});

// Displays the workout id, title, desc, and type of a particular workout
$app->get('/workout/{workout_id}', function ($request, $response, $args) {
    // get workout id
    $workout_id = $args['workout_id'];

    try
    {
        // connect to pocketgains db
        // change dbConn to api_login for testing server
        $db = $this->dbConn;

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
        echo '{"error":{"text"' . $e->getMessage() . '}}';
    }
});

// Displays the workout history of the logged in user
$app->get('/getHistory/{user_id}', function ($request, $response, $args) {
    // get user id
    $user_id = $args['user_id'];

    try
    {
        // connect to pocketgains db
        // change dbConn to api_login for testing server
        $db = $this->dbConn;

        if ($db)
        {
            $query = $db->prepare("SELECT h.hist_id, h.time_stamp, h.duration, h.reps, h.weight
                FROM Workout_History h, Workout w WHERE h.User_user_id = :user_id
                AND w.workout_id = h.Workout_workout_id");
            $query->execute(array('user_id' => $user_id));

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
        echo '{"error":{"text"' . $e->getMessage() . '}}';
    }
});
