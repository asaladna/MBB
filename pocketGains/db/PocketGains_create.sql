-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-03-29 23:29:23.585




-- tables
-- Table Achievements
CREATE TABLE Achievements (
    achieve_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    `desc` varchar(500)  NOT NULL,
    CONSTRAINT Achievements_pk PRIMARY KEY (achieve_id)
);

-- Table Achievements_Completed
CREATE TABLE Achievements_Completed (
    User_user_id int  NOT NULL,
    Achievements_achieve_id int  NOT NULL,
    CONSTRAINT Achievements_Completed_pk PRIMARY KEY (User_user_id,Achievements_achieve_id)
);

-- Table Faved_Workouts
CREATE TABLE Faved_Workouts (
    fav_id int  NOT NULL,
    Workout_workout_id int  NOT NULL,
    User_user_id int  NOT NULL,
    reps int  NULL,
    sets int  NULL,
    weight int  NULL,
    duration int  NULL,
    CONSTRAINT Faved_Workouts_pk PRIMARY KEY (fav_id)
);

-- Table Geolocation
CREATE TABLE Geolocation (
    location_id int  NOT NULL,
    latitude int  NOT NULL,
    longitude int  NOT NULL,
    radius int  NOT NULL,
    CONSTRAINT Geolocation_pk PRIMARY KEY (location_id)
);

-- Table Points
CREATE TABLE Points (
    User_user_id int  NOT NULL,
    cardio int  NOT NULL,
    arms int  NOT NULL,
    legs int  NOT NULL,
    back int  NOT NULL,
    shoulders int  NOT NULL,
    chest int  NOT NULL,
    CONSTRAINT Points_pk PRIMARY KEY (User_user_id)
);

-- Table Suggested_Workouts
CREATE TABLE Suggested_Workouts (
    sug_id int  NOT NULL,
    Workout_workout_id int  NOT NULL,
    User_user_id int  NOT NULL,
    reps int  NULL,
    sets int  NULL,
    weight int  NULL,
    duration int  NULL,
    CONSTRAINT Suggested_Workouts_pk PRIMARY KEY (sug_id)
);

-- Table User
CREATE TABLE User (
    user_id int  NOT NULL,
    authToken varchar(25)  NOT NULL,
    session_id int  NOT NULL,
    username varchar(25)  NOT NULL,
    email varchar(35)  NOT NULL,
    password varchar(25)  NOT NULL,
    salt varchar(50)  NOT NULL,
    sex bool  NOT NULL,
    goal int  NOT NULL,
    cardioPref int  NOT NULL,
    exp int  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (user_id)
);

-- Table Workout
CREATE TABLE Workout (
    workout_id int  NOT NULL,
    title varchar(50)  NOT NULL,
    `desc` varchar(500)  NULL,
    type varchar(15)  NOT NULL,
    CONSTRAINT Workout_pk PRIMARY KEY (workout_id)
);

-- Table Workout_History
CREATE TABLE Workout_History (
    hist_id int  NOT NULL,
    Workout_workout_id int  NOT NULL,
    User_user_id int  NOT NULL,
    time_stamp timestamp  NOT NULL,
    duration int  NULL,
    reps int  NULL,
    sets int  NULL,
    weight int  NULL,
    CONSTRAINT Workout_History_pk PRIMARY KEY (hist_id)
);





-- foreign keys
-- Reference:  Achievements_Completed_Achievements (table: Achievements_Completed)

ALTER TABLE Achievements_Completed ADD CONSTRAINT Achievements_Completed_Achievements FOREIGN KEY Achievements_Completed_Achievements (Achievements_achieve_id)
    REFERENCES Achievements (achieve_id);
-- Reference:  Achievements_Completed_User (table: Achievements_Completed)

ALTER TABLE Achievements_Completed ADD CONSTRAINT Achievements_Completed_User FOREIGN KEY Achievements_Completed_User (User_user_id)
    REFERENCES User (user_id);
-- Reference:  Faved_Workouts_User (table: Faved_Workouts)

ALTER TABLE Faved_Workouts ADD CONSTRAINT Faved_Workouts_User FOREIGN KEY Faved_Workouts_User (User_user_id)
    REFERENCES User (user_id);
-- Reference:  Faved_Workouts_Workout (table: Faved_Workouts)

ALTER TABLE Faved_Workouts ADD CONSTRAINT Faved_Workouts_Workout FOREIGN KEY Faved_Workouts_Workout (Workout_workout_id)
    REFERENCES Workout (workout_id);
-- Reference:  Suggested_Workouts_User (table: Suggested_Workouts)

ALTER TABLE Suggested_Workouts ADD CONSTRAINT Suggested_Workouts_User FOREIGN KEY Suggested_Workouts_User (User_user_id)
    REFERENCES User (user_id);
-- Reference:  Suggested_Workouts_Workout (table: Suggested_Workouts)

ALTER TABLE Suggested_Workouts ADD CONSTRAINT Suggested_Workouts_Workout FOREIGN KEY Suggested_Workouts_Workout (Workout_workout_id)
    REFERENCES Workout (workout_id);
-- Reference:  Table_5_User (table: Points)

ALTER TABLE Points ADD CONSTRAINT Table_5_User FOREIGN KEY Table_5_User (User_user_id)
    REFERENCES User (user_id);
-- Reference:  Workout_History_User (table: Workout_History)

ALTER TABLE Workout_History ADD CONSTRAINT Workout_History_User FOREIGN KEY Workout_History_User (User_user_id)
    REFERENCES User (user_id);
-- Reference:  Workout_History_Workout (table: Workout_History)

ALTER TABLE Workout_History ADD CONSTRAINT Workout_History_Workout FOREIGN KEY Workout_History_Workout (Workout_workout_id)
    REFERENCES Workout (workout_id);



-- End of file.

