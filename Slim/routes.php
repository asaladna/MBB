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
            $db = $this->dbConn;

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
