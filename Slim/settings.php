<?php

header('Access-Control-Allow-Origin: *');  

return [
    'settings' => [
        'displayErrorDetails' => true, // set to false in production

        // Renderer settings
        'renderer' => [
            'template_path' => __DIR__ . '/../templates/',
        ],

        // Monolog settings
        'logger' => [
            'name' => 'slim-app',
            'path' => __DIR__ . '/../logs/app.log',
        ],

        'api_login' => [ 
            'username' => 'api_test',         
            'password' => 'qwe123',              
            'host' => 'localhost',              
            'dbname' => 'pocketgains',          
            'db' => 'mysql' 
        ],
    ],
];
