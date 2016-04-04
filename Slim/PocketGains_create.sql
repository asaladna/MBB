-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-03-30 20:56:56.368

DROP DATABASE IF EXISTS pocketgains;

CREATE DATABASE pocketgains;

USE pocketgains;

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
    authToken varchar(25)  NULL,
    session_id int  NULL,
    username varchar(25)  NOT NULL,
    password varchar(25)  NOT NULL,
    salt varchar(50)  NOT NULL,
    email varchar(35)  NOT NULL,
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

INSERT INTO Achievements (achieve_id, name, `desc`) values (1, 'A journey of 1000 miles starts with a single step', 'Run for a total of 1 mile');
INSERT INTO Achievements (achieve_id, name, `desc`) values (2, 'The running man', 'Run for a total of 5 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (3, 'Quick Feet', 'Run for a total of 25 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (4, 'Hamster on a wheel', 'Run for a total of 50 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (5, 'And the bass keeps runnin\' runnin\'', 'Run for a total of 100 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (6, 'Marathon Runner', 'Run for a total of 250 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (7, 'Super Sonic', 'Run for a total of 500 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (8, 'Running around the world', 'Run for a total of 1000 miles');
INSERT INTO Achievements (achieve_id, name, `desc`) values (9, 'Welcome to the club', 'Use this app for 1 day');
INSERT INTO Achievements (achieve_id, name, `desc`) values (10, 'Return Customer', 'Use this app for 2 days');
INSERT INTO Achievements (achieve_id, name, `desc`) values (11, 'Daily User', 'Use this app for 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (12, 'Month Man', 'Use this app for 1 month');
INSERT INTO Achievements (achieve_id, name, `desc`) values (13, 'It has been half a year', 'Use this app for 6 months');
INSERT INTO Achievements (achieve_id, name, `desc`) values (14, 'Happy New Year', 'Use this app for 1 year');
INSERT INTO Achievements (achieve_id, name, `desc`) values (15, 'Happy anniversary', 'Use this app for 2 years');
INSERT INTO Achievements (achieve_id, name, `desc`) values (16, 'You''re still here?', 'Use this app for 5 years');
INSERT INTO Achievements (achieve_id, name, `desc`) values (17, 'Wobbly legs', 'Lift 10 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (18, 'Double or nothing', 'Lift 30 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (19, 'Sore Legs', 'Lift 50 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (20, 'Iron Legs', 'Lift 75 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (21, 'Work those buns and thighs', 'Lift 100 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (22, 'Thunder Thighs', 'Lift 150 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (23, 'Steel legs', 'Lift 200 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (24, 'Heavyweight champion', 'Lift 250 or more pounds in a leg workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (25, 'Gotta start somewhere', 'Lift 10 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (26, 'I can see your muscles', 'Lift 30 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (27, 'Sore arms', 'Lift 50 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (28, 'Bulking up', 'Lift 75 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (29, 'Swole', 'Lift 100 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (30, 'The Rock', 'Lift 150 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (31, 'Superman', 'Lift 200 or more pounds in an upper body workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (32, 'A new life', 'Open this app for the first time');
INSERT INTO Achievements (achieve_id, name, `desc`) values (33, 'Top 300', 'Rank within the top 300 of any type of workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (34, 'Top 150', 'Rank within the top 150 of any type of workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (35, 'Top 100', 'Rank within the top 100 of any type of workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (36, 'Top 50', 'Rank within the top 50 of any type of workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (37, 'Top 10', 'Rank within the top 10 of any type of workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (38, 'Number 1', 'Rank as number 1 in a workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (39, 'Level Up', 'Reach level 2');
INSERT INTO Achievements (achieve_id, name, `desc`) values (40, 'Getting the hang of things', 'Reach level 5');
INSERT INTO Achievements (achieve_id, name, `desc`) values (41, 'Levels and Levels', 'Reach level 10');
INSERT INTO Achievements (achieve_id, name, `desc`) values (42, 'Big Gains', 'Reach level 25');
INSERT INTO Achievements (achieve_id, name, `desc`) values (43, 'Attention Getter', 'Reach level 50');
INSERT INTO Achievements (achieve_id, name, `desc`) values (44, 'On top of the World', 'Reach level 100');
INSERT INTO Achievements (achieve_id, name, `desc`) values (45, 'My first Workout', 'Log 1 workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (46, 'Workout starter', 'Log a total of 25 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (47, 'Workout Planner', 'Log a total of 50 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (48, 'Workout Intellect', 'Log a total of 100 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (49, 'Workout Researcher', 'Log a total of 250 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (50, 'Workout Expeditionist', 'Log a total of 500 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (51, 'Workout Architect', 'Log a total of 1000 workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (52, 'Recommendation', 'Do 1 recommended workout');
INSERT INTO Achievements (achieve_id, name, `desc`) values (53, 'A helping hand', 'Do a total of 25 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (54, 'Open to suggestion', 'Do a total of 50 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (55, 'Constructive Critism', 'Do a total of 100 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (56, 'Advice follower', 'Do a total of 250 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (57, 'Support from above', 'Do a total of 500 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (58, 'Endorsement', 'Do a total of 1000 recommended workouts');
INSERT INTO Achievements (achieve_id, name, `desc`) values (59, 'A few good points', 'Earn 25 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (60, 'Point Getter', 'Earn 50 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (61, 'Free Flowing', 'Earn 75 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (62, 'Drowning in points', 'Earn 100 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (63, 'Show stopper', 'Earn 250 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (64, 'Extreme Training', 'Earn 500 points in 1 week');
INSERT INTO Achievements (achieve_id, name, `desc`) values (65, 'Hell Week', 'Earn 1000 points in 1 week');
INSERT INTO Achievements (achieve_id, name, desc) values (66, 'Gym Rat', 'Create an account on PocketGains!');

-- End of file.

