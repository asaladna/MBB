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

        $db = $this->dbConn;

        // grab username and password from db
        // need to also add session info to db and query when I figure that stuff out
        $query = $db->prepare("SELECT username, password FROM User WHERE username = :username LIMIT 1");
        $query->execute(array('username' => $username));
        
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
                // set session info here
                // go to user dashboard
                return $this->renderer->render($response, 'dashboard.html', $args);
            }
            // add error stuff here
        }
        // add more error stuff here
    }
});
