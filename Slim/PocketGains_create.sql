-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-04-16 21:44:34.907


DROP DATABASE IF EXISTS pocketgains;

CREATE DATABASE pocketgains;

USE pocketgains;

-- tables
-- Table: Achievements
CREATE TABLE Achievements (
    achieve_id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    `desc` varchar(500) NOT NULL,
    CONSTRAINT Achievements_pk PRIMARY KEY (achieve_id)
);

-- Table: Achievements_Completed
CREATE TABLE Achievements_Completed (
    User_user_id int NOT NULL AUTO_INCREMENT,
    Achievements_achieve_id int NOT NULL,
    CONSTRAINT Achievements_Completed_pk PRIMARY KEY (User_user_id,Achievements_achieve_id)
);

-- Table: Faved_Workouts
CREATE TABLE Faved_Workouts (
    fav_id int NOT NULL AUTO_INCREMENT,
    Workout_workout_id int NOT NULL,
    User_user_id int NOT NULL,
    reps int NULL,
    sets int NULL,
    weight int NULL,
    duration int NULL,
    CONSTRAINT Faved_Workouts_pk PRIMARY KEY (fav_id)
);

-- Table: Geolocation
CREATE TABLE Geolocation (
    location_id int NOT NULL AUTO_INCREMENT,
    latitude int NOT NULL,
    longitude int NOT NULL,
    radius int NOT NULL,
    CONSTRAINT Geolocation_pk PRIMARY KEY (location_id)
);

-- Table: Is_Type
CREATE TABLE Is_Type (
    Types_type_id int NOT NULL,
    Workout_workout_id int NOT NULL,
    CONSTRAINT Is_Type_pk PRIMARY KEY (Types_type_id,Workout_workout_id)
);

-- Table: Points
CREATE TABLE Points (
    User_user_id int NOT NULL,
    cardio int NOT NULL,
    arms int NOT NULL,
    legs int NOT NULL,
    back int NOT NULL,
    shoulders int NOT NULL,
    chest int NOT NULL,
    CONSTRAINT Points_pk PRIMARY KEY (User_user_id)
);

-- Table: Types
CREATE TABLE Types (
    type_id int NOT NULL AUTO_INCREMENT,
    name varchar(25) NOT NULL,
    CONSTRAINT Types_pk PRIMARY KEY (type_id)
);

-- Table: User
CREATE TABLE User (
    user_id int NOT NULL AUTO_INCREMENT,
    authToken varchar(25) NULL,
    session_id int NULL,
    username varchar(25) NOT NULL,
    password varchar(25) NOT NULL,
    salt varchar(25) NULL,
    email varchar(35) NULL,
    sex varchar(15) NOT NULL,
    goal varchar(25) NOT NULL,
    cardioPref varchar(25) NULL,
    exp int NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (user_id)
);

-- Table: Workout
CREATE TABLE Workout (
    workout_id int NOT NULL AUTO_INCREMENT,
    title varchar(50) NOT NULL,
    `desc` varchar(1500) NULL,
    CONSTRAINT Workout_pk PRIMARY KEY (workout_id)
);

-- Table: Workout_History
CREATE TABLE Workout_History (
    hist_id int NOT NULL AUTO_INCREMENT,
    Workout_workout_id int NOT NULL,
    User_user_id int NOT NULL,
    time_stamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    duration int NULL,
    reps int NULL,
    sets int NULL,
    weight int NULL,
    CONSTRAINT Workout_History_pk PRIMARY KEY (hist_id)
);

-- foreign keys
-- Reference: Achievements_Completed_Achievements (table: Achievements_Completed)
ALTER TABLE Achievements_Completed ADD CONSTRAINT Achievements_Completed_Achievements FOREIGN KEY Achievements_Completed_Achievements (Achievements_achieve_id)
    REFERENCES Achievements (achieve_id);

-- Reference: Achievements_Completed_User (table: Achievements_Completed)
ALTER TABLE Achievements_Completed ADD CONSTRAINT Achievements_Completed_User FOREIGN KEY Achievements_Completed_User (User_user_id)
    REFERENCES User (user_id);

-- Reference: Faved_Workouts_User (table: Faved_Workouts)
ALTER TABLE Faved_Workouts ADD CONSTRAINT Faved_Workouts_User FOREIGN KEY Faved_Workouts_User (User_user_id)
    REFERENCES User (user_id);

-- Reference: Faved_Workouts_Workout (table: Faved_Workouts)
ALTER TABLE Faved_Workouts ADD CONSTRAINT Faved_Workouts_Workout FOREIGN KEY Faved_Workouts_Workout (Workout_workout_id)
    REFERENCES Workout (workout_id);

-- Reference: Table_5_User (table: Points)
ALTER TABLE Points ADD CONSTRAINT Table_5_User FOREIGN KEY Table_5_User (User_user_id)
    REFERENCES User (user_id);

-- Reference: Type_List_Types (table: Is_Type)
ALTER TABLE Is_Type ADD CONSTRAINT Type_List_Types FOREIGN KEY Type_List_Types (Types_type_id)
    REFERENCES Types (type_id);

-- Reference: Type_List_Workout (table: Is_Type)
ALTER TABLE Is_Type ADD CONSTRAINT Type_List_Workout FOREIGN KEY Type_List_Workout (Workout_workout_id)
    REFERENCES Workout (workout_id);

-- Reference: Workout_History_User (table: Workout_History)
ALTER TABLE Workout_History ADD CONSTRAINT Workout_History_User FOREIGN KEY Workout_History_User (User_user_id)
    REFERENCES User (user_id);

-- Reference: Workout_History_Workout (table: Workout_History)
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
        INSERT INTO Achievements (achieve_id, name, `desc`) values (33, 'Top 300', 'Rank within the top 300 of an of workout');
        INSERT INTO Achievements (achieve_id, name, `desc`) values (34, 'Top 150', 'Rank within the top 150 of an of workout');
        INSERT INTO Achievements (achieve_id, name, `desc`) values (35, 'Top 100', 'Rank within the top 100 of an of workout');
        INSERT INTO Achievements (achieve_id, name, `desc`) values (36, 'Top 50', 'Rank within the top 50 of an of workout');
        INSERT INTO Achievements (achieve_id, name, `desc`) values (37, 'Top 10', 'Rank within the top 10 of an of workout');
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
        INSERT INTO Achievements (achieve_id, name, `desc`) values (66, 'Gym Rat', 'Create an account on PocketGains!');

        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (1, 'Joan', 'SMBmxdrIoieN', 'sVk90MUZV', 'jhowell0@si.edu', 1, 2, 9217);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (2, 'Louise', 'WllBLU', 'mbSU42t1ZBi5', 'lowens1@globo.com', 0, 0, 5187);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (3, 'Michael', '6O0mGdBx', 'VbVAKU', 'mperez2@chronoengine.com', 1, 1, 7261);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (4, 'Russell', 'qFsgJqKy', 'DLDP77j3Xu', 'rbell3@cbsnews.com', 1, 2, 5279);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (5, 'Janet', 'LhI7H9JAe1g2', 'YN1R5bpXvCVK', 'jsimmons4@parallels.com', 1, 1, 4396);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (6, 'Christine', 'cw0k6FNQ48', 'ndHsCR', 'cruiz5@prweb.com', 0, 2, 4286);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (7, 'Charles', 'eeeDBnFLptr', 'nS87DFZDkDvW', 'cmcdonald6@foxnews.com', 1, 1, 2778);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (8, 'Catherine', 'jDO5Tw4DqSKh', 'cbaWTCJ', 'chernandez7@sbwire.com', 1, 0, 8693);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (9, 'Harry', 'o6A24O', 'A8TmZs3ckWp', 'hedwards8@csmonitor.com', 0, 0, 8420);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (10, 'Katherine', 'DsE43KTaO', 'ZGXAYq3l', 'kcarroll9@symantec.com', 1, 1, 9309);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (11, 'Bobby', 'an5LRo4A9R', 'NdkbEns', 'bdunna@bbb.org', 0, 2, 3228);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (12, 'Douglas', 'IEB2id', 'SgUAegcpa5', 'dbrownb@samsung.com', 1, 1, 9140);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (13, 'Eugene', 'Eb9LDS0', 'JTN7FrjW', 'eporterc@mapy.cz', 1, 2, 1276);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (14, 'Stephen', 'L7y1dFfzTcco', '3NzRLc0im', 'skimd@drupal.org', 0, 1, 7205);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (15, 'Johnny', '1NPGKKSft45', '1y3tqao', 'jduncane@moonfruit.com', 0, 2, 1873);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (16, 'Jennifer', 'BCVQ2MTkZKE', 'ldmt5Z2aC', 'jhansenf@home.pl', 0, 0, 6478);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (17, 'Irene', 'AV61EiVJbYf', 'ms2PM9', 'idavisg@live.com', 1, 2, 1819);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (18, 'Raymond', 'MPj5PvKj2t1v', 'dSqISHK', 'rholmesh@umn.edu', 0, 2, 8401);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (19, 'Martin', 'Woinusfy3WWz', 'mnlOhk4FO8', 'mrayi@telegraph.co.uk', 0, 2, 7254);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (20, 'Roger', 'UujJEB05O', 'J9qmnz', 'rbutlerj@washington.edu', 1, 0, 2340);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (21, 'Betty', 'm3lwCYegXKm9', 'qhvF5kbq', 'blarsonk@pagesperso-orange.fr', 0, 1, 3222);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (22, 'Ashley', 'y36grVvTKL9', 'Cxtbb0TsxebU', 'areidl@cdc.gov', 1, 2, 6909);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (23, 'Diane', 'g0e8KhHg6', 'wLGI2x2b3', 'draym@deliciousdays.com', 0, 0, 1349);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (24, 'Terry', 'sgYsfBgoVo', 'hc7D6XfQ9', 'thernandezn@yellowbook.com', 0, 2, 3015);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (25, 'Wayne', 'jGGhxBMO', 'U7DL2sHH', 'whendersono@google.ru', 0, 1, 9739);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (26, 'William', 'VhQmWwoigOVC', 'BFTXzUGj', 'wadamsp@wsj.com', 0, 0, 4659);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (27, 'Amy', 'vfCW4O1qPAMy', 'JM3op1iY', 'asanchezq@bloomberg.com', 0, 2, 706);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (28, 'Ryan', 'MCNIJUHsCuX', 'bwGOeZ', 'rlawrencer@webmd.com', 1, 1, 1344);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (29, 'Lori', 'MWTv3I', 'JAk8RV', 'lcarrolls@nytimes.com', 1, 2, 8899);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (30, 'Anthony', 'aNjrGZHzLjQ', 'egMmBfX', 'atuckert@themeforest.net', 0, 0, 9770);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (31, 'Victor', 'esQ4OH0u', '0vdhcwxL4D0L', 'vhowellu@freewebs.com', 0, 1, 55);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (32, 'Carl', 'uBfUh9wC', '6hg9qw', 'cgomezv@miibeian.gov.cn', 0, 0, 9264);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (33, 'Harold', 'le5zYSGJxSc', '0uMMo6CRDc3', 'holsonw@vk.com', 1, 0, 7877);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (34, 'Aaron', 'k5Jl0UocXB', 'qaM9Zg0I', 'aleex@unicef.org', 1, 1, 3608);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (35, 'Maria', 'M1oc35XTr', 'yXsX1M1c', 'mnelsony@addtoany.com', 1, 0, 1844);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (36, 'George', 'XlAQ9vcFT', 'QWmTMgOswt', 'gadamsz@skyrock.com', 1, 1, 4054);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (37, 'Matthew', 'NOb9jEY50x', 'a77zzz9', 'maustin10@4shared.com', 1, 2, 8817);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (38, 'Michelle', 'MOKPrq9', 'zQ4bu74bfiN', 'mlittle11@lycos.com', 1, 2, 2432);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (39, 'Emily', 'PYa81u7yW', '01iv1oT', 'epeters12@fda.gov', 1, 1, 5490);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (40, 'Billy', 's11kzu', 'VVSLjFhY', 'bsimpson13@google.com', 0, 1, 5974);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (41, 'Jose', 'nRqCZ0', 'FW73BKesdz', 'jreyes14@rakuten.co.jp', 1, 0, 1000);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (42, 'Willie', 'E7vYfsFRC', '9lEv8Jpzi12z', 'wturner15@tripod.com', 1, 1, 4699);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (43, 'Joe', 'lr6b70', 'GKbsN0oodTZ0', 'jwilliamson16@networkadvertising.org', 0, 0, 8533);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (44, 'Paul', 'nuTLWYJu', '0gFUiHVbo', 'pcarroll17@cbslocal.com', 1, 2, 5449);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (45, 'Nicholas', '4AKONynm', '2yINk7', 'nfox18@usnews.com', 0, 0, 1600);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (46, 'Nicole', '16Dn4jBVD', 'taWGbJ', 'nstevens19@weather.com', 1, 0, 7090);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (47, 'Bruce', 'udZibyjd0O', 'Ow1ubMMnS', 'banderson1a@chronoengine.com', 0, 0, 1588);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (48, 'Cynthia', 'qHdDhbofC6', 'GFUO1iW1Oy', 'cgonzalez1b@sciencedaily.com', 1, 2, 9202);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (49, 'Todd', 'JI0WeRo', 'O8VItQos3fPR', 'twebb1c@ycombinator.com', 1, 2, 8899);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (50, 'James', 'CpdBbA', 'Jwktejxh', 'jcarpenter1d@barnesandnoble.com', 0, 0, 8035);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (51, 'Patricia', 'JjPCoxr', 'EZkDnZkTgISD', 'ppierce1e@dedecms.com', 0, 0, 279);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (52, 'Roger', 'mDHButZrv', 'bEyzbX2', 'rnelson1f@fotki.com', 1, 1, 8204);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (53, 'Adam', 'S7YraqsGxiGV', 'yO5T2R', 'areyes1g@bbc.co.uk', 1, 2, 4442);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (54, 'Ann', 'Hp1qxPVYN', 'KlueQr', 'awatkins1h@sbwire.com', 0, 1, 3654);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (55, 'Clarence', '28BCArYt', 'fwRPuuId', 'cbradley1i@angelfire.com', 0, 0, 5341);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (56, 'Deborah', 'DBZ5HXWmfTX', 'YTAImFs6e6', 'dgibson1j@yahoo.com', 0, 2, 7191);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (57, 'Douglas', '4jXY07JOo9', 'QfGd1MwCOS54', 'dgarcia1k@homestead.com', 1, 0, 8094);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (58, 'Roy', 'SElMkRS', 'tzk3th', 'rperez1l@epa.gov', 1, 0, 8648);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (59, 'Betty', 'fyxAtkmFL7q', 'ng8ZRkbAGuOD', 'bpierce1m@mapy.cz', 0, 1, 4870);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (60, 'Christopher', 'ORKwGyc', '8ilZ4oo', 'ccarter1n@ow.ly', 0, 1, 1255);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (61, 'Kathy', 'HfAC8ur', 'qkBidYYnF9d', 'kbowman1o@is.gd', 1, 1, 2894);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (62, 'Wayne', 'rrTsCO', '0kOsqgsk', 'wsimpson1p@51.la', 1, 1, 7614);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (63, 'Janice', 'q6FCyNrtOh62', '3ZuRG4', 'jolson1q@cam.ac.uk', 1, 0, 5532);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (64, 'Beverly', 'EdNI2Aof', 'sZYFcZOnrIG', 'btucker1r@google.fr', 0, 1, 11);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (65, 'Mark', 'uFRH2ufVxuw', 'ylfpAa90j5', 'mferguson1s@netlog.com', 1, 2, 3672);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (66, 'Rose', 't5iPe8WmP', 'yWKC6z4rMmgb', 'rdean1t@spotify.com', 0, 2, 6532);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (67, 'Joseph', 'IIvB5AvCj3L', 'HHXAk0c', 'jpalmer1u@springer.com', 1, 0, 2037);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (68, 'Amanda', 'EZ1Fkn', 'eD4LWx7gQ0', 'amills1v@edublogs.org', 0, 1, 1134);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (69, 'Thomas', 'QJmPyv', 'elJejBEI2', 'thamilton1w@pbs.org', 0, 1, 7855);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (70, 'Anthony', '9rJz7zZxmw', 'uXh2P60Q', 'agarza1x@cam.ac.uk', 1, 1, 7061);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (71, 'Nicole', 'A4UqxN', 'Ych9du6wqZk', 'nmatthews1y@hatena.ne.jp', 0, 1, 5202);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (72, 'Susan', 'kL2CRnjYDIEa', '1W92ZZdTKF', 'sbishop1z@yellowbook.com', 1, 2, 9845);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (73, 'Joshua', 'akJPQmJ2G', 'CgWbDv', 'jwilliams20@icq.com', 0, 2, 2322);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (74, 'Eugene', 't28r5J', 'twSVhv71sS', 'ewillis21@people.com.cn', 0, 1, 4324);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (75, 'Alice', 'Ka7Qt2tr0r', 'AcuGVoU6T7QF', 'afuller22@google.nl', 0, 0, 3862);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (76, 'Johnny', 'BC90mWA17', 'H27cWL8I', 'jberry23@engadget.com', 0, 0, 345);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (77, 'Raymond', '4ifXbrFKy7hd', 'DQS7pSY92mhC', 'rlane24@tiny.cc', 1, 1, 3274);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (78, 'Philip', '3AX5O3', 'pPzCsW85sUj', 'psanchez25@about.com', 0, 0, 3689);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (79, 'Frances', '0DKRllT0L21A', 'zH5Fwq', 'fparker26@tmall.com', 1, 1, 8187);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (80, 'Robert', '5ILgCBSVA2dx', 'P49IKI', 'rgonzalez27@amazon.co.uk', 0, 1, 6580);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (81, 'Thomas', 'JGZxvebwLXFJ', '42ccHzoxupJH', 'taustin28@reverbnation.com', 1, 0, 2067);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (82, 'Russell', 'ZkRoe9ho10JH', 'ccP1wL', 'rcook29@opera.com', 1, 0, 2533);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (83, 'Jean', 'e5PYggvxy', 'TM7VctGNxY8', 'jbrown2a@wunderground.com', 1, 1, 7993);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (84, 'Alice', 'G3GrxrRhzho', 'BOa6YyG7wd1', 'arichardson2b@weibo.com', 1, 0, 8733);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (85, 'Lawrence', 'v8JFmPlTcOra', 'utckzr', 'landerson2c@usatoday.com', 0, 2, 8308);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (86, 'Patrick', 's5jjsQVrP8C', '4hZpLT', 'pfreeman2d@shop-pro.jp', 1, 1, 3996);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (87, 'Andrea', 'nV3ukhvOMYZ', 'Q2UFpJxdi', 'aflores2e@ucla.edu', 1, 1, 1005);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (88, 'Jennifer', 'P4qSuhRmKhD', 'otVHFnouNdvG', 'jfisher2f@com.com', 0, 1, 7724);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (89, 'Dennis', 'mVuGR3', '4omRtt', 'dgarcia2g@independent.co.uk', 1, 0, 8675);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (90, 'Sarah', 'BQvUx3HF5qi1', 'thvUMnGL', 'sedwards2h@bigcartel.com', 0, 1, 2304);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (91, 'Christopher', '2YIgF2UwQ6z', 'HN5leQ5N4VV', 'chanson2i@huffingtonpost.com', 1, 0, 5148);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (92, 'Jacqueline', '14Pj00C', '89uWm4RW', 'jallen2j@instagram.com', 1, 2, 9091);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (93, 'Rebecca', 'gapdMSNm', 'jP1ejJf', 'rtucker2k@devhub.com', 1, 0, 1777);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (94, 'Stephanie', 'BqZly13yigmJ', 'YxkpQxl', 'swalker2l@sciencedaily.com', 1, 0, 2890);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (95, 'James', 'xVEi1h6RABE3', '3MESc8k', 'jthompson2m@fastcompany.com', 1, 0, 3488);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (96, 'Kathleen', 'sUSC8C', 'IdK1BU12iw2', 'kthompson2n@buzzfeed.com', 0, 0, 9543);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (97, 'Julie', 'hMckGgtpjK55', '5r3cNqL', 'jwilliamson2o@walmart.com', 1, 2, 334);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (98, 'George', 'nyy1JDNFzOt', 'kQHqRmLqd', 'gkennedy2p@ucoz.com', 0, 2, 4281);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (99, 'Lois', 'HcdnWxDMG1', 'zITtbYUbv1b', 'lwells2q@networksolutions.com', 0, 2, 2795);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (100, 'Sara', 'wIwvFzH', 'R75j3c', 'slong2r@huffingtonpost.com', 0, 1, 4054);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (101, 'Jose', 'Mh4VcQfhob', '7rJRtZrjxxsX', 'jortiz2s@cbslocal.com', 1, 2, 234);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (102, 'Martha', 'tgdKs1', 'zSytBzPKuT', 'mruiz2t@spotify.com', 1, 1, 4076);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (103, 'Brenda', 'bJAbI5n0T', 'aLeJ51q9i', 'bcampbell2u@ca.gov', 0, 1, 6020);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (104, 'Harry', 'tPNzJj7Ev', 'YhyQEC8JqFFx', 'hwilliams2v@cmu.edu', 0, 1, 5136);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (105, 'Samuel', 'BvTuYx4Te', '9Me4d0', 'swelch2w@walmart.com', 1, 2, 1971);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (106, 'Todd', 'IvO3OxrmY', 'SjSiYL', 'tburton2x@purevolume.com', 0, 2, 9578);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (107, 'Amanda', 'uOjTr6cyV', 'u8ecA6MSmawq', 'acarpenter2y@sohu.com', 0, 0, 4059);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (108, 'Martin', 'hoKhU9OlJpUV', 'cBZdmmOF', 'mhudson2z@tinypic.com', 0, 0, 7860);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (109, 'William', 'IewQPKZQjIlM', 'BxY627IjW', 'warmstrong30@amazon.co.jp', 0, 2, 1093);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (110, 'Terry', 'dxhR3qoQ0nz', '5FElAs', 'twarren31@github.com', 0, 1, 4949);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (111, 'Roy', '9WBIe7', 'M4U9G4IQKV', 'rcunningham32@springer.com', 1, 0, 6459);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (112, 'Beverly', 'HN696HKG', 'knOUWM1hfau', 'bnelson33@google.com.br', 0, 0, 2684);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (113, 'Douglas', 'HsktKyGB', 'uA76K1BiF4', 'dsanders34@furl.net', 1, 1, 7699);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (114, 'Ruby', 'cG1fdqtMhz', 'IgKTZla8KJ', 'rdavis35@unc.edu', 0, 1, 5487);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (115, 'Sara', 'uyDbIk', 'wVL8pPr0LXLU', 'sellis36@topsy.com', 1, 1, 493);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (116, 'Alice', '70SnuvFBajzH', '1NVkoG6KsL6', 'awallace37@theglobeandmail.com', 0, 1, 9181);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (117, 'Eugene', 'nJoTdx', 'bdBRe96CYDL', 'egray38@cpanel.net', 1, 0, 6310);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (118, 'Victor', 'pfD8yab', 'VxbYnjoU6GF', 'vspencer39@edublogs.org', 0, 0, 5253);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (119, 'Louise', 'f7Rsfo', 'hDldtRf6', 'lgraham3a@cpanel.net', 1, 2, 1722);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (120, 'Steven', 'q5X2C7DbS27', 'cK9fGrv4e', 'smccoy3b@goo.gl', 0, 1, 5364);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (121, 'Willie', 'JRJbG3vaf', 'vWt7rW', 'wjames3c@gmpg.org', 1, 0, 6156);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (122, 'Eugene', 'AHythUD75', 'kkXF5ji0jD', 'estone3d@mlb.com', 1, 0, 6181);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (123, 'Cheryl', 'QRQMvKy41', 'WgpRQ1KOwXAd', 'chenderson3e@smh.com.au', 1, 0, 2945);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (124, 'Evelyn', 't2uhhoau53jc', '6wCI2d8mTzl', 'eberry3f@geocities.jp', 0, 0, 2107);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (125, 'Jonathan', 'dnDwjRKr', 'bhaIl5qa', 'jkim3g@networkadvertising.org', 0, 0, 6704);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (126, 'Willie', '5K44W8X5o', 'qruIF4g8yA', 'wharrison3h@vkontakte.ru', 0, 2, 629);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (127, 'Tammy', 'JZOrmU', 'LTI8yw', 'tharris3i@creativecommons.org', 1, 1, 1307);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (128, 'Sarah', '2yh4Bq8NMEk', 'jdrAY3WjdqRX', 'sjones3j@purevolume.com', 1, 2, 9828);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (129, 'Frank', 'AhYGuklM', '5uxOgx', 'fhart3k@china.com.cn', 0, 2, 3716);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (130, 'Ruth', 'aZtbOlfw', 'vTemHUn3z1Ul', 'rbennett3l@uol.com.br', 1, 0, 2684);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (131, 'Gregory', '0azUpuKEOx', '0rBSQCMY', 'ghawkins3m@sourceforge.net', 0, 0, 6265);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (132, 'Dennis', 'Lb2GJ8l', '96JGxofp0R', 'dhughes3n@psu.edu', 1, 2, 8853);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (133, 'Julie', '4PnNHXf6l', 'JJ1R6l74L4Q', 'jgreene3o@ucoz.com', 0, 2, 7718);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (134, 'Kathy', 'CAQeMJt', 'kRTbHay1', 'kwalker3p@stanford.edu', 0, 0, 2308);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (135, 'Carl', 'WCjszbM5Lds', '51aaz5D', 'cfranklin3q@webs.com', 0, 1, 6660);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (136, 'Anne', 'rhGmRJcA9Cm', 'KZ6vLDnSr', 'aboyd3r@dailymotion.com', 0, 1, 7036);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (137, 'Barbara', 'qo7E8KGl', 'sGkduj9uIPkj', 'bmorris3s@hostgator.com', 1, 0, 460);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (138, 'Edward', '3liAeE2XZ', 'Y1KlnY', 'ehicks3t@cnbc.com', 1, 1, 3698);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (139, 'Terry', '1w8sXvsqD', '31Fi6KGMjIGH', 'tcarpenter3u@cocolog-nifty.com', 0, 1, 7174);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (140, 'Louis', 'fLobcXk6yYk', '1yRZiWVQMgxi', 'lfuller3v@clickbank.net', 0, 0, 9523);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (141, 'Brenda', 'bfAgrsjZ0J0C', 'Zi6u67FTaJLg', 'bgonzales3w@ocn.ne.jp', 0, 2, 7004);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (142, 'Harold', 'O8wNClbkOc', '0nJmta6KCNxF', 'hhicks3x@utexas.edu', 0, 2, 6514);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (143, 'Walter', 'aOEvpOdpEp', '6gV2W9HQkBf', 'wmills3y@1und1.de', 1, 0, 4835);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (144, 'Harold', 'fQxgqlMln', 'YaxW3n', 'hstanley3z@cbsnews.com', 1, 2, 8230);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (145, 'Rebecca', 'ALY6Wt1VX', 'tDWhhhN61x', 'rjacobs40@wordpress.org', 0, 0, 5132);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (146, 'Fred', 'jjlPN7', 'BTONuJ5iTUTr', 'farnold41@nature.com', 0, 2, 251);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (147, 'Philip', 'lcyJ9eEc', 'c3KfCC', 'pspencer42@upenn.edu', 0, 2, 2321);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (148, 'Edward', 'dzK6C9pfGuX', 'nvBXAgPMSbw', 'egarrett43@theguardian.com', 0, 1, 7753);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (149, 'Eric', 'ZBjrkiZ', 'wZkvttaZJO', 'ebaker44@delicious.com', 1, 1, 237);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (150, 'Aaron', 'htvWWWUAf', 'amXQsk', 'ariley45@nifty.com', 1, 2, 9632);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (151, 'Steve', 'nu3fbYFBxBf', 'zJXu8m79zS', 'sgriffin46@gnu.org', 1, 2, 1184);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (152, 'Andrew', 'wbv8tfMXh', 'uJB4n7YZ', 'awheeler47@google.com.au', 0, 0, 3424);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (153, 'Aaron', 'k4G8gKKjG', 'ZRgLRxk', 'astephens48@bloglovin.com', 0, 0, 3375);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (154, 'Richard', '8Yzs3GqcXBwF', '9SsKwYkN9qM', 'rburns49@goodreads.com', 0, 1, 8370);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (155, 'Aaron', 'a5NCVRv5Oq', 'SKpbNBIw', 'acook4a@businessinsider.com', 1, 1, 3873);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (156, 'Michelle', 'XKvjIjUsOucY', 'nLOJQAibDl', 'mporter4b@stanford.edu', 0, 2, 5079);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (157, 'Jeremy', 'neV2NBIVEPs', 'ldKi2iFxs', 'jbaker4c@over-blog.com', 0, 0, 381);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (158, 'Tina', 'KL7ABHnGCj6', 'cuzb17hWPdBU', 'tellis4d@freewebs.com', 0, 0, 3599);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (159, 'Judith', '8uZk0CCgfon', 'X0F6CJJ0', 'jaustin4e@epa.gov', 1, 2, 8858);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (160, 'Ruby', 'LxV7hot4o80t', 'Q4V6lTI9EGE', 'rhansen4f@reuters.com', 1, 1, 9452);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (161, 'Russell', 'vEE2ejNPDzU', 'tGOWRcYz3JC', 'rsims4g@4shared.com', 0, 0, 99);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (162, 'Sean', 'RsUzS0ncbo', '6HZYMB', 'sharper4h@bbb.org', 1, 0, 12);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (163, 'Karen', '3annJUUG0', 'la0cZFdA', 'khill4i@apache.org', 0, 2, 740);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (164, 'Stephanie', 'yl7hk4', '06l1lW5UP2c', 'swagner4j@hexun.com', 1, 1, 9142);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (165, 'Helen', 'kAWvPAwzjx', 'mdOIjxGXr', 'hdixon4k@hubpages.com', 1, 2, 630);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (166, 'Harry', 'uGFjhl', 'VQSqytlxGa', 'hmurphy4l@icio.us', 1, 0, 1172);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (167, 'Todd', 'r6EP7DKcNYkm', 'naNnURpYoM', 'triley4m@typepad.com', 0, 0, 5015);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (168, 'Fred', 'ADpDA8Vwja', 'zjTNyDinNO', 'fmarshall4n@disqus.com', 1, 2, 4130);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (169, 'Donna', 'qUIHq4pFG', 'FGoSckHDuJt', 'dhughes4o@hexun.com', 1, 1, 1409);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (170, 'Timothy', 'eKZyMLDjef', 'eGPbqVy', 'treid4p@ca.gov', 1, 0, 6107);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (171, 'Nancy', 'Tiii4y7N1UF', 'mlGBovQ41', 'ngarcia4q@sina.com.cn', 1, 0, 407);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (172, 'Nicholas', 'jEADUNgN3qUH', 'QxpWoqM3wGv', 'ntaylor4r@comcast.net', 0, 1, 8326);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (173, 'Janice', '4kbdzNJdfP', 'hKsog6', 'jellis4s@squidoo.com', 0, 2, 8761);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (174, 'Betty', 'se9sa1ki', 'ASTcht', 'bross4t@mashable.com', 0, 1, 570);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (175, 'Beverly', 'j21Wh5lY5WCc', 'EZrrUwHKnk', 'bmartin4u@imdb.com', 1, 2, 6661);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (176, 'George', '0pUahb', 'red900', 'glee4v@typepad.com', 0, 0, 8272);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (177, 'Helen', '5w3Vqvg', 'CFIIuvmRV', 'hrichards4w@ebay.co.uk', 0, 0, 8268);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (178, 'Brandon', 'HS8sJJcSNmSI', 'aRn5FrWD8', 'bsullivan4x@walmart.com', 0, 1, 4244);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (179, 'Mark', 'fN01WeE4bf5l', 'lD7PcWC8YqwH', 'mhunter4y@bloglovin.com', 0, 0, 4588);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (180, 'Christine', 'IrjhVcb', 'ZP6T0NY0sE', 'ckelley4z@virginia.edu', 0, 1, 2220);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (181, 'Sharon', 'X3m01P', 'p6maFx', 'swells50@meetup.com', 0, 1, 6935);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (182, 'Sharon', 'Pp1J32Qx', '3ljzTVpnkHE', 'sschmidt51@msu.edu', 0, 0, 1040);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (183, 'Christina', 'q0I6P0b3Fk', 'uwM6srUZg', 'cbell52@salon.com', 0, 1, 3067);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (184, 'Kimberly', 'BELPznX', 'gLxtnpl5D', 'kwright53@narod.ru', 0, 0, 2287);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (185, 'Jimmy', 'oZzRwJGxam', 'K2mYgH5D', 'jreid54@theatlantic.com', 0, 1, 7613);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (186, 'Ryan', 'H2ND8Z1', 'mVephX8y9vj', 'roliver55@elegantthemes.com', 1, 2, 9417);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (187, 'Ernest', '9u4qRsYyG9Ub', 'hkpFh42', 'ewheeler56@odnoklassniki.ru', 1, 0, 1826);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (188, 'Karen', 'WLNG2jI4op', 'L135NKF', 'kblack57@t-online.de', 0, 1, 5266);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (189, 'Diana', '0RYr9oOj6', 'BII9UMAiG', 'dwheeler58@blinklist.com', 1, 1, 1224);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (190, 'Matthew', 'J9aMg5ojn4', 'vhobDna2', 'mjackson59@sphinn.com', 0, 0, 1484);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (191, 'Andrew', 'gMbF5d', 'JEesSSccv5', 'apayne5a@engadget.com', 0, 2, 3923);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (192, 'Rebecca', '6NKdjB', 'afNI3XUIi', 'rgilbert5b@biglobe.ne.jp', 0, 1, 9937);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (193, 'Henry', '9vWGUDA', '2EUFOpk', 'hcruz5c@ehow.com', 1, 2, 8215);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (194, 'Sara', 'TY4wZgXWO2ra', 'FlcZj1p0', 'shughes5d@discuz.net', 0, 1, 1543);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (195, 'Angela', '4MG6x5iSLJ8', 'rQLDXdfsS', 'agilbert5e@shareasale.com', 0, 0, 6352);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (196, 'Henry', 'enYC6jY3qwr', 'J8UJyO', 'hcarroll5f@weebly.com', 1, 0, 246);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (197, 'Helen', 'OybvenUuodK', '5ThkPewDp', 'hfisher5g@slashdot.org', 0, 2, 8719);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (198, 'Peter', 'PxJM8vbSL', '53XNpo2n', 'psnyder5h@zdnet.com', 0, 2, 6556);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (199, 'Raymond', 'GLFAXSKM', 'SXdNzZtx5TK', 'rharrison5i@flavors.me', 1, 1, 9530);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (200, 'Stephanie', 'gt7pVFQm2d', 'APUIDgYtOsde', 'swatkins5j@hibu.com', 1, 0, 1939);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (201, 'Stephen', '8NPajnK', 'VjZsWevhL', 'sstone5k@ucoz.ru', 0, 1, 3477);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (202, 'Frances', 'mWgKoJ7FquN', 'VveSnZdS', 'fpatterson5l@ask.com', 0, 0, 9622);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (203, 'Sharon', 'D862067w2a', 'apljrZ4wF', 'sharris5m@histats.com', 1, 0, 6731);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (204, 'Jose', 'OG9Ghd46s7w2', 't9gaWPS9pg2', 'jgibson5n@wikia.com', 0, 0, 9247);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (205, 'Roy', 'P7lDok16lp', 'TGZl1hSu1', 'rstephens5o@pinterest.com', 0, 2, 4641);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (206, 'Todd', 'tlusayeVdvC', 'l0G2U7', 'tmedina5p@youku.com', 1, 0, 8389);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (207, 'Joyce', 'rlFzwjdZ3l4H', 'GffzLl', 'jbowman5q@sun.com', 1, 2, 1250);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (208, 'Russell', 'QUsCObwUjD', 'vGjj306', 'rking5r@etsy.com', 0, 1, 6637);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (209, 'Marilyn', 'fX79YurCTr', 'schCqaJMD', 'mprice5s@360.cn', 1, 2, 6035);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (210, 'Todd', 'LAk1Rz4', 'E35XMniyD6', 'tflores5t@usda.gov', 0, 0, 2488);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (211, 'Judith', 'GQiOiHj', 'uneSb32jQ', 'jjohnson5u@gmpg.org', 0, 0, 3387);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (212, 'Eugene', 'ToQP0bf', 'ATJNSIQJO9', 'eboyd5v@engadget.com', 1, 1, 3137);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (213, 'Pamela', 'ch3kjBQej', 'luRAnGIXR', 'pharrison5w@theatlantic.com', 0, 2, 6895);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (214, 'Lisa', 'd0rIiDhLJBa', 'bQgM4Ic', 'lholmes5x@oaic.gov.au', 0, 1, 9268);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (215, 'Maria', 'SmpzrW6TsI', '8qRlMo2FsxO4', 'mwest5y@virginia.edu', 0, 2, 6948);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (216, 'Irene', 'uj6N9Uj', 'fr9U1I', 'imartin5z@blogtalkradio.com', 0, 1, 5240);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (217, 'Rachel', 'D4KSD2NKJ', 'xkzNiMPkz', 'rlee60@ucsd.edu', 0, 2, 9483);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (218, 'Anna', 'JbaZFpFNqKa', 'tPX5S8CLnJ', 'afox61@illinois.edu', 1, 1, 3697);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (219, 'Martin', 'QmTFOFqhE', 'Hf9k5VmplPrR', 'mandrews62@hugedomains.com', 0, 1, 1843);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (220, 'Anne', 'A34gECFS', 'lAbwzj8a', 'alittle63@globo.com', 1, 0, 2169);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (221, 'Julie', 'lKoIB7', 'yHRtLFSA', 'jbennett64@mail.ru', 1, 1, 1286);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (222, 'Jane', 'HyYLqSlA', '4ssz9qNt4', 'jgonzalez65@macromedia.com', 1, 2, 7392);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (223, 'Jason', 'qZpHiDyIv', 'UYXNBEK', 'jgrant66@deliciousdays.com', 0, 0, 7934);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (224, 'Rachel', 'zTFNyY', 'CaRLq2ngD', 'rfrazier67@webeden.co.uk', 0, 1, 591);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (225, 'Raymond', 'qiDIKKd', 'V0vAYJt2', 'rclark68@independent.co.uk', 1, 0, 3315);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (226, 'Todd', 'W3n9SQK8LKD', 'S4VJ0zrF', 'tgreen69@gmpg.org', 0, 2, 4183);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (227, 'Howard', 'NiNrrUHc', 'gQVKyW', 'hblack6a@walmart.com', 1, 0, 6100);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (228, 'Ryan', 'JeF6JGGbDZr', 'MzEG78Lhicv', 'rbrooks6b@bluehost.com', 1, 0, 4446);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (229, 'Margaret', '7uH3jG', '5wOSpJEk', 'mmccoy6c@kickstarter.com', 1, 0, 9438);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (230, 'Clarence', 'GDPywIqt', 'Xq9V561jjHp', 'crose6d@amazon.co.jp', 1, 1, 198);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (231, 'George', 'DfznkqViP', 'bBiVGxVJRK0', 'ghoward6e@huffingtonpost.com', 1, 1, 6445);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (232, 'Timothy', 'i9cXue', 'AkcgEI', 'tschmidt6f@alibaba.com', 1, 1, 9744);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (233, 'Jack', 'vrDgxhPml7Z', 'uOn3UwvHHRY0', 'jbryant6g@is.gd', 1, 0, 2605);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (234, 'Rebecca', 'afJpexI4JyXe', 'q0HZHyI', 'rjordan6h@tinypic.com', 0, 1, 769);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (235, 'Harold', 'VuV5RIIX6', 'o23OHRRhT7', 'hedwards6i@nytimes.com', 0, 2, 6797);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (236, 'Shawn', 'bLhVSJMHYBbw', 'Sv65Z3nAamk', 'spowell6j@amazonaws.com', 0, 1, 3547);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (237, 'Kathy', 'zykQHrtl', 'RiwFlq3', 'krichardson6k@bloglines.com', 0, 0, 1248);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (238, 'Beverly', 'GnnIGNRBOMM', 'KTp4XaRK', 'bbowman6l@sfgate.com', 1, 1, 4214);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (239, 'Willie', '9Xb9ofD', 'znNez3Wjh5', 'wjenkins6m@zimbio.com', 0, 0, 1711);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (240, 'Brenda', 'MxjbvSC', 'oK5wVvs5JN', 'bfreeman6n@github.com', 1, 0, 4744);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (241, 'Evelyn', 'zI6ocA9d3', '1RxC8BeFAg3O', 'emeyer6o@seesaa.net', 1, 0, 8883);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (242, 'Willie', '8QDxROEbpS', 'G2paSw', 'whamilton6p@wordpress.com', 0, 1, 4719);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (243, 'Aaron', 'KIHSU0I8L', 'bmuyWXGjDf', 'aburton6q@usatoday.com', 1, 1, 3306);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (244, 'Jack', 'Wtw29i5eu', '83E4MBA65Da', 'jwatkins6r@youtube.com', 1, 1, 1183);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (245, 'Aaron', '8XUCsAk', 'hs6NUbJMBPJh', 'aandrews6s@sbwire.com', 1, 2, 1642);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (246, 'Ruth', 'lYwquek85I', 'VrI4PnCDDpF', 'rbarnes6t@springer.com', 1, 0, 5779);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (247, 'Nicole', 'JDfXXiZO4zg', 'oEEcROO', 'nallen6u@scientificamerican.com', 0, 0, 4938);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (248, 'Karen', '3ZUYbtHEd2f', 'iI1CSGGmr1Cz', 'kwarren6v@myspace.com', 0, 1, 7871);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (249, 'Catherine', 'iIEow0', 'CI4YSeUd', 'cmcdonald6w@yellowpages.com', 0, 1, 1208);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (250, 'Alice', 'FKyLBsqSkZj', '9qiJwi', 'agriffin6x@dmoz.org', 0, 0, 6935);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (251, 'Kathy', '1bC1G4lveDc', 'Zev3IV', 'krichardson6y@cnet.com', 0, 1, 4589);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (252, 'Henry', 'RLn3kTahE', 'uvNUSs', 'handrews6z@washington.edu', 0, 1, 6205);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (253, 'Robin', 'WKcLHRrUITmh', 'GhzhUJwV', 'rramirez70@usnews.com', 0, 1, 9927);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (254, 'Earl', 'gyO273u', 'Fy9f7SubT6PT', 'erichards71@uol.com.br', 1, 1, 9816);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (255, 'Carol', 'Djcwo7Ci', 'ipXERTgV3', 'calvarez72@newyorker.com', 0, 0, 5041);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (256, 'Jean', 'MIV33q', '4x02gkXrWeXy', 'jjones73@purevolume.com', 1, 0, 6534);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (257, 'Norma', 'aobewFyq', 'mY6P54rXK', 'nmccoy74@jimdo.com', 1, 1, 146);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (258, 'Gloria', 'CeSyJRbqcEj', 'sm86CU82It', 'gdaniels75@parallels.com', 0, 0, 6171);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (259, 'Linda', 'lDdgHBWBAX', '2QoKqK', 'lbennett76@unesco.org', 1, 0, 4955);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (260, 'Randy', 'JNsn4Aw0FkzL', 'vXJ4S9', 'rphillips77@si.edu', 0, 2, 6646);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (261, 'Charles', 'saFgCWrXAgmg', 'SHW1lbH6V5', 'cperkins78@marriott.com', 0, 2, 2320);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (262, 'Brian', 'vStRBGRf02EN', 'auofO5ZaCw', 'bcook79@forbes.com', 1, 2, 9480);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (263, 'Katherine', 'tqJm2T', 'aroHdMBxF3lN', 'kjohnson7a@t-online.de', 0, 1, 9624);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (264, 'Sandra', 'UstKVDgho', 'ZooZp5Y', 'sfreeman7b@usa.gov', 1, 0, 8836);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (265, 'Joe', 'kQxOHlLpTuTt', 'W05TNStHQNI', 'jknight7c@unicef.org', 0, 1, 6922);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (266, 'Harold', '3AXgMGQWa', 'rwqxaNA', 'hparker7d@cisco.com', 0, 2, 5766);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (267, 'David', 'yah0SOop', '6SWFMDRb', 'dtorres7e@oakley.com', 0, 2, 4048);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (268, 'Paula', 'wQtpHv', 'xwEc7ZHe', 'pwhite7f@cbslocal.com', 1, 2, 9031);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (269, 'Albert', 'YTgohIAKgL', 'iMm7Qh', 'ahunter7g@tinypic.com', 0, 1, 3734);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (270, 'Raymond', 'VSS9N6', 'vQHpVd', 'rmitchell7h@prweb.com', 0, 2, 343);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (271, 'Janice', 'tcBx8llmfB', 'ouBcyUhDQO', 'jburke7i@bandcamp.com', 0, 2, 9797);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (272, 'Linda', '8mHokyH', 'lurwGLsIz', 'landrews7j@nydailynews.com', 1, 0, 3083);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (273, 'Gloria', 'H2W0zbD', 'FKWmfSP', 'ghill7k@nyu.edu', 0, 0, 4363);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (274, 'Stephanie', 'fGfBbp2x4k', 'UfLD4qAFNn', 'sclark7l@marriott.com', 1, 2, 9501);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (275, 'Angela', 'IDTFactdn', 'IXfjDJmWo9', 'adaniels7m@theatlantic.com', 1, 2, 9201);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (276, 'Dennis', 'jhWYEbxP6', 'ejCh1PPuCuU', 'dweaver7n@dot.gov', 1, 0, 9601);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (277, 'Terry', 'p3zzvZKghYZ', '5YI5oHZ', 'tbell7o@apache.org', 1, 1, 2669);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (278, 'Wanda', '9Ml8DUVF9', 'DbE9EZHfUqm', 'wjordan7p@cbslocal.com', 0, 0, 4049);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (279, 'Jane', 'AZgz6tk', '9rYItg3a88WA', 'jandrews7q@arstechnica.com', 0, 0, 2326);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (280, 'Amanda', 'eet7VchV', 'ZQK9TzJ', 'abradley7r@shutterfly.com', 1, 1, 6388);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (281, 'Angela', 'p1Dudi7i', 'TcIrr96q', 'aduncan7s@cornell.edu', 1, 0, 2336);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (282, 'Dennis', 'lVj8xd', 'yMnyS4', 'daustin7t@mapquest.com', 0, 1, 6672);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (283, 'Kevin', '734fNa69THSg', 'nvsH68cGlxM', 'kmccoy7u@ucsd.edu', 0, 2, 5647);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (284, 'Adam', 'Ej94r0', 'VdE2eF018', 'awagner7v@paginegialle.it', 0, 2, 6773);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (285, 'Paula', 'Id2mtjJyP', 'PWxI35T7M', 'pboyd7w@google.co.uk', 1, 1, 5573);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (286, 'Sara', 'wfDkmk', 'ZadvzePl9tN', 'sburns7x@oakley.com', 1, 0, 8083);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (287, 'Harry', 'jfKA6wQ', '0ocmZfaBP61r', 'hmcdonald7y@canalblog.com', 0, 2, 6062);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (288, 'Joseph', 'Yj4269Ta9', '3pfoDjONby', 'jmiller7z@foxnews.com', 0, 1, 8327);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (289, 'Nicole', 'MHjtl1gRpZD', '6qfWUFTPULy6', 'nalvarez80@oakley.com', 0, 2, 9877);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (290, 'Fred', 'q7HCZqyVrXoM', '3DSJZW5k', 'fpowell81@scribd.com', 1, 1, 7995);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (291, 'Joseph', 'SPPgFJW', 'FTHSqIhkey', 'jperez82@intel.com', 1, 2, 6323);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (292, 'Billy', 'nnbcsXE', 'aLnFafi', 'bnichols83@qq.com', 0, 1, 1038);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (293, 'Brian', 'bga5Nyzu2dK', 'XIr7kb5', 'blewis84@histats.com', 0, 0, 10);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (294, 'Gloria', 'cy09372', 'bxySzauCsy6', 'gpeterson85@berkeley.edu', 1, 2, 591);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (295, 'Maria', 'MPLtqB1GsWa6', 'u5WdpNWjl9o', 'mwebb86@issuu.com', 0, 0, 3551);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (296, 'Sharon', 'hCJ55wfr3vs', 'WbzA5tXBw', 'staylor87@psu.edu', 0, 0, 4559);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (297, 'Timothy', 'K8RB4Fi50r', 'Cl02Mx', 'tblack88@virginia.edu', 1, 0, 4551);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (298, 'Lisa', 'iqhf1Zi66', 'bv92vMYm', 'ljohnston89@harvard.edu', 0, 2, 4066);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (299, 'Martin', 'esNVgeH', 'yW4OwqxYNw', 'mburns8a@fema.gov', 0, 1, 3835);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (300, 'Phyllis', 'PQ3Jnv', 'ueDlym', 'pwhite8b@moonfruit.com', 1, 1, 452);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (301, 'Deborah', 'H0G8CkX', 'yuEcdgdX', 'dpalmer8c@europa.eu', 0, 2, 7903);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (302, 'Lawrence', 'W4aQQt4', '0Oziqyt', 'lcarpenter8d@thetimes.co.uk', 0, 1, 2025);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (303, 'Anna', 'RSZeWQRbHFt', 'cJ5XsegPMAv', 'awheeler8e@weibo.com', 1, 2, 2087);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (304, 'Robert', 'MTo1jphF', 'Y7LVSoO', 'rray8f@mit.edu', 0, 1, 9328);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (305, 'Tina', 'nxzHSA', 'QI7MElGUohjD', 'twebb8g@cbslocal.com', 1, 0, 4806);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (306, 'Randy', 'IvsSiKFbl', 'Kqy6VW6r5DPO', 'rharvey8h@nsw.gov.au', 1, 2, 4025);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (307, 'Paul', 'XkBPfbtjiM', 'Mw21N4jp0', 'phayes8i@webeden.co.uk', 1, 1, 7884);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (308, 'Brenda', 'J6lEDyT3b', 'Qhr2dxT', 'bcastillo8j@seattletimes.com', 0, 2, 2675);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (309, 'Kathy', 'gj9akEVY', 'vo9lJrjmF3', 'klynch8k@wufoo.com', 0, 1, 3161);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (310, 'Denise', 'IV8NyXU', 'nUhbJm', 'dmartin8l@who.int', 1, 1, 6433);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (311, 'Virginia', 'gL0qAGy', 'QqTZJJvFo', 'vlewis8m@qq.com', 0, 2, 7710);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (312, 'Thomas', 'rcT63XmWK14', '3sbtcWqW', 'tlynch8n@people.com.cn', 1, 2, 4842);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (313, 'Philip', 'k7h54nrc1e', 'RDph5FZH7n3', 'panderson8o@mail.ru', 1, 1, 8972);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (314, 'Debra', '5FVEuDzd', 'CZfuya', 'dlane8p@mlb.com', 0, 2, 8775);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (315, 'Gloria', 'Y4wXVyMea3td', 'RJNA6g90Bq', 'gweaver8q@aol.com', 1, 0, 2576);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (316, 'Betty', 'IYWqgzb', 'KEyHaz7280', 'bcarter8r@mashable.com', 0, 2, 3044);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (317, 'Marilyn', 'oyqjGW', 'JxkYw8TA', 'mlewis8s@live.com', 0, 1, 9829);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (318, 'Sarah', '4ai7zB', 'TAySNF', 'sroberts8t@ocn.ne.jp', 0, 0, 8177);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (319, 'Ronald', '0yM2rou', 'rKboPIX', 'rberry8u@arizona.edu', 0, 1, 7191);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (320, 'Antonio', 'E7y3fTK6EZ8v', '2fO5X3fcbvhh', 'aholmes8v@jugem.jp', 0, 0, 5356);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (321, 'Betty', 'NnOHYPGj', 'DJ51umm2DM', 'bmitchell8w@oracle.com', 0, 2, 3610);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (322, 'Gregory', 'Pb9bslO4h', 'kjGBoqYsIVp', 'gfowler8x@linkedin.com', 0, 0, 6321);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (323, 'Roy', 'RSNJ4YZUHj', 'rWfT2em', 'rwilson8y@yellowpages.com', 1, 2, 8606);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (324, 'Wayne', 'RWL5GQUphEGr', 'pdHX6E', 'wburton8z@reference.com', 0, 2, 3208);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (325, 'Gloria', 'OV25PMBstGg', 'wAjpq6qx', 'grice90@utexas.edu', 1, 0, 6994);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (326, 'Brian', '0JKG3CJJ4s', '6DCvvJq', 'bgordon91@cdc.gov', 1, 1, 5717);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (327, 'Anna', 'fdErnr9tZOnv', 'WbwNepQA', 'awillis92@soundcloud.com', 0, 0, 6297);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (328, 'Randy', '4tqnrBAj', '0lxIE7Z', 'rmoreno93@wordpress.com', 1, 1, 9378);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (329, 'Nicholas', '2dn6GnjXV15', 'DkIaej3wwGm', 'ngilbert94@utexas.edu', 1, 1, 3418);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (330, 'Nancy', 'I6oUhxw', 'yIOv5e', 'nellis95@live.com', 0, 0, 1048);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (331, 'Gloria', 'TCceyni1sxU', '430z6N', 'gwilliams96@macromedia.com', 1, 0, 5093);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (332, 'Earl', 'MQm9xMIPaLe', 'RVXm8B1', 'etaylor97@ft.com', 0, 2, 1746);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (333, 'Edward', 'HP5Q017q', 'xfEEKDZUkSsq', 'ehill98@omniture.com', 0, 1, 8675);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (334, 'Samuel', 'BvsTBvIP18c', 'CS1DzU', 'sthompson99@cnbc.com', 0, 2, 8726);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (335, 'Sandra', 'D4euBvkezwW', 'XpLy4dtlu', 'smiller9a@ameblo.jp', 0, 2, 5361);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (336, 'Rose', 'zcibc0gZ4Cd', 'TfIuMWUnYgTD', 'rlong9b@google.nl', 1, 1, 3233);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (337, 'Tina', 'VVyu08c', 'dooB9ISWFhdy', 'truiz9c@infoseek.co.jp', 0, 2, 315);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (338, 'Antonio', 'DAbDOpJP8w', '44Xi1Z2kDo', 'asnyder9d@tripadvisor.com', 0, 1, 593);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (339, 'Antonio', 'ktRqBFx', 'F6wEFCjKFUZs', 'ascott9e@mayoclinic.com', 1, 0, 5226);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (340, 'Ruby', 'FVdCdCF', 'X6ZpxplLrDUz', 'rmorris9f@aboutads.info', 1, 1, 7143);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (341, 'Mark', 'iIntlrDpoO', 'rDqwZpkM', 'mjacobs9g@sbwire.com', 0, 2, 8761);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (342, 'Jose', '6hPO4ODt09', 'mfTgc5m', 'jberry9h@domainmarket.com', 1, 1, 3952);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (343, 'Janice', 'wBXbGD12', 'UlEkmRjB', 'jbrooks9i@macromedia.com', 1, 0, 5870);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (344, 'Annie', 'EWFUphGQtIyI', 'eSvEu7bQU', 'aharrison9j@columbia.edu', 1, 1, 5304);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (345, 'Jacqueline', 'wgl65b', 'D45lMpZ1Szp', 'jmurray9k@list-manage.com', 1, 2, 7485);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (346, 'Brian', 'H8Oo9jU', 'VSdTCB7WVRs', 'bhunt9l@blogger.com', 0, 1, 4434);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (347, 'Rose', 'jCOu5nMdG', 't7tIcwjLBU7v', 'rhall9m@walmart.com', 1, 0, 4910);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (348, 'Jimmy', 'fa0Gj8qMcX', 'uv76C4iafvd', 'jduncan9n@blinklist.com', 1, 0, 3251);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (349, 'Betty', 'qnwNuU', '5Y2g0vKmhVV', 'bhayes9o@ucsd.edu', 1, 0, 3715);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (350, 'Willie', '22I71BKbNSd', 'mwrQAQeP', 'whill9p@creativecommons.org', 0, 2, 3285);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (351, 'Donald', 'xPSAXpD', 'OIf743O82', 'dcooper9q@statcounter.com', 0, 0, 9733);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (352, 'Randy', 'IzlyuVOz', 'rHh1ghlJJTh', 'rhenry9r@gmpg.org', 1, 0, 299);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (353, 'Emily', '7yxsxvUH', 'D2ZtiYaTY', 'esanders9s@pagesperso-orange.fr', 0, 0, 1973);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (354, 'Anthony', 'J7TU09j', '725Zvj', 'aspencer9t@china.com.cn', 0, 1, 3573);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (355, 'Kathryn', 'pjJvG6S', 'QGK4y95i1DkW', 'kdean9u@tripod.com', 0, 2, 1469);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (356, 'Christina', 'v6JFxHLNu', 'efggTEU5y0', 'crichardson9v@stanford.edu', 1, 0, 5712);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (357, 'Bonnie', '1FynwNrjRwh', 'M1IcRss', 'bjordan9w@flavors.me', 0, 0, 2658);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (358, 'Lisa', 'FCuAhKfZmcDj', 'RT0LmZWLW1sK', 'ldavis9x@sbwire.com', 1, 1, 1155);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (359, 'Melissa', 'VWVsJevesHqN', 'hfyUGWo', 'mcrawford9y@homestead.com', 0, 1, 5233);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (360, 'Shawn', '3UbFw80wLY0', 'J2nc8Y5Cv5T', 'sarmstrong9z@cpanel.net', 0, 2, 6867);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (361, 'Kathleen', 'HwauxKZku', 'wVgi4gQag9nC', 'kmorrisona0@arstechnica.com', 0, 0, 4922);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (362, 'Ruby', 'weLN1Jc', '9mbayL', 'rwalkera1@guardian.co.uk', 0, 0, 8981);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (363, 'Cheryl', 'nL9IBsWqF', 'dmL0H5', 'cyounga2@istockphoto.com', 1, 1, 4142);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (364, 'Thomas', 'UAvdb81h', 'AjQSrMy', 'thendersona3@skype.com', 1, 2, 8964);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (365, 'Sarah', 'MubVLCBeKp', '8Y2tufe4e', 'salexandera4@yolasite.com', 1, 0, 2959);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (366, 'Cheryl', 'pCgmYoihJ', '47BbJb1Z', 'cbowmana5@w3.org', 1, 2, 1599);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (367, 'Heather', 'JdwC1B4', 'D3nALr0', 'hrileya6@berkeley.edu', 0, 2, 4771);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (368, 'Fred', 'v1QmrS0djuY', 'mOipc7l5d8', 'fraya7@github.com', 0, 1, 3822);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (369, 'Dorothy', 'seLssLlgUXEY', 'HOjYu8BO', 'dharveya8@pinterest.com', 1, 2, 3045);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (370, 'Julie', 'EAMiC6PoFtQ4', '7fjMIcCA6', 'jbishopa9@washington.edu', 0, 0, 3022);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (371, 'Arthur', 'Jgy6cnu0', 'PBGxctBw', 'aturneraa@skype.com', 1, 1, 2847);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (372, 'Philip', 'WCz4xT0Dat', 'i3p3hhrv1b', 'psmithab@yolasite.com', 0, 0, 3172);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (373, 'Russell', 'uFdYxmOX41', 'AoiSDlKp9', 'rruizac@wikispaces.com', 0, 1, 3905);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (374, 'Virginia', '77CjMQYLAu', 'lDDfti5nLHv', 'vkennedyad@deviantart.com', 1, 1, 7251);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (375, 'Christine', 'i9WQFMjxM', 'yrrh0oj5vo', 'cromeroae@vistaprint.com', 0, 0, 2906);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (376, 'Steve', 'l14QDL', 'ghOD6m5OPKL', 'shayesaf@yellowpages.com', 1, 1, 1039);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (377, 'Betty', 'AoiGPS', 'Ss7YaCnZxm', 'boliverag@histats.com', 0, 0, 122);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (378, 'Dennis', '1KEls6p', 'B91ORiBN', 'drobinsonah@adobe.com', 1, 1, 7005);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (379, 'Robert', 'skw7YWC', 'ySEmYOji00', 'rlopezai@baidu.com', 0, 1, 6447);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (380, 'Antonio', '6wFUf9BcC2n', 'twVBAw9', 'aknightaj@wunderground.com', 0, 0, 7625);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (381, 'George', 'vpU1QlLXWuG', 'zeVFCck0C', 'ghansenak@zimbio.com', 0, 2, 2163);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (382, 'Carlos', '5fM2UzDm3v', 'eIItdKirWmu', 'cgrayal@pcworld.com', 0, 2, 3038);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (383, 'Phyllis', 'JaINPhlPc', 'H9bNpgbicdef', 'ppriceam@nationalgeographic.com', 1, 2, 5139);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (384, 'Robert', 'C1YkiceZ0', 'WQB4elW8y', 'rlarsonan@instagram.com', 1, 2, 5514);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (385, 'Jack', 'CYQW7C6k', 'XybSodj0', 'jellisao@nationalgeographic.com', 0, 0, 3209);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (386, 'Frances', 'pq35sbY', 'XiSP4sl', 'fspencerap@nifty.com', 0, 2, 4606);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (387, 'Matthew', 'BZZ2TrQI8Tt0', '9LchpJTaW8L', 'mblackaq@intel.com', 0, 1, 5226);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (388, 'Robin', '0MNVKm', 'oKUxhk', 'rwagnerar@ucoz.com', 0, 0, 1969);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (389, 'Willie', 'T6BihfYN', 'SmLSZDo', 'whunteras@google.com.au', 0, 2, 1672);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (390, 'Sandra', 'v0taX6OdPh', 'TWBbFtwaYF', 'sspencerat@chron.com', 0, 0, 9382);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (391, 'Ernest', 'IHkQvRCvG', 'wCtUI1ZJ', 'ehansenau@youtube.com', 1, 1, 6697);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (392, 'Shirley', '7aKLYMFNx', 'jMCL8IHrh3', 'schavezav@comsenz.com', 0, 0, 9575);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (393, 'Timothy', 't8Y38O6PDj0E', 'zLxLpn', 'trogersaw@un.org', 0, 2, 1645);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (394, 'Fred', 'JRZOtG6', 'wvkbpH9', 'fcooperax@nifty.com', 1, 0, 8993);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (395, 'Jeffrey', 'Iypz45CVp2', 'g7VWDQRF', 'jhansonay@ow.ly', 1, 1, 754);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (396, 'Bobby', '47cdSs', '4p81kbEKoG', 'breynoldsaz@china.com.cn', 1, 0, 3781);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (397, 'Andrew', 'N0bIuNv02DJO', 'SXgDQSPvPkxH', 'adeanb0@scientificamerican.com', 1, 2, 4263);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (398, 'Jeremy', '6O5MGS', 'aC3laGvVaMh2', 'jjenkinsb1@technorati.com', 1, 2, 8294);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (399, 'Helen', 'eXxVSdlf7XY', 'Xi5IUIImcLd', 'hjohnstonb2@webs.com', 0, 0, 8943);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (400, 'Sean', '3XinF1OH8', 'ThUmnebDdrDa', 'swellsb3@xrea.com', 1, 2, 3693);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (401, 'Ann', 'a0HAmBWLH2', 'K3iroJnIeh', 'apierceb4@comsenz.com', 0, 1, 1091);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (402, 'John', 'Vl40j7C', 'Zg45xT65E0W9', 'jperezb5@plala.or.jp', 0, 2, 2483);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (403, 'Katherine', 'y5dnzuyz', '8Ygam2ox', 'kduncanb6@youtu.be', 1, 0, 2742);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (404, 'Ronald', 'BfAkNfexgV', 'YqkBcnhF7', 'rwillisb7@scribd.com', 0, 1, 7342);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (405, 'Carol', 'DPwiUhtmkxsp', '3EpPWT', 'chendersonb8@google.co.jp', 1, 2, 1837);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (406, 'Michelle', 'eapUGUj0Su0d', 'O3LH8pTaA', 'mcoleb9@icio.us', 0, 2, 6033);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (407, 'Johnny', 'MneNZCXodRv', '3aVX9lRIG', 'jrobertsba@pinterest.com', 1, 1, 5812);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (408, 'Billy', 'k4f4oryndP', 'R2UTnJCq', 'bmcdonaldbb@g.co', 1, 0, 8877);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (409, 'Sarah', 'kaowETUY', 'TXxPDHbc', 'sjacksonbc@cnn.com', 0, 0, 3790);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (410, 'Fred', 'O0efpYvOkch', 'Ygle4HuccZwo', 'fstevensbd@networkadvertising.org', 0, 2, 5078);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (411, 'Donald', 'gUR9Hfd', 'FkhuKm6r', 'doliverbe@mit.edu', 1, 2, 8982);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (412, 'Todd', 'a4EpmYy', 'gY5VdjO0f', 'twilliamsbf@netscape.com', 0, 2, 3290);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (413, 'Mary', 'AchMBLTfm', 'sxbmtzh7', 'mhansonbg@loc.gov', 1, 0, 2254);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (414, 'Philip', '4q6p3iw0iVO', '17ESzbj', 'pcolemanbh@guardian.co.uk', 0, 0, 8866);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (415, 'Diane', '1KooWVqRa', 'VDro1et', 'dgrantbi@constantcontact.com', 1, 0, 989);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (416, 'Victor', '72n4gRZE', 'rr0e6Jf5', 'vmoorebj@163.com', 0, 2, 2741);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (417, 'Ann', 'PGxKO6yp', 'a7Fctz', 'acruzbk@google.ru', 1, 1, 5683);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (418, 'Carlos', '4GgQboqpjWYp', 'imClF5', 'cwoodsbl@nba.com', 1, 1, 4636);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (419, 'Antonio', 'PGuGUldaF', 'NJzLH24sxro', 'athomasbm@blinklist.com', 1, 0, 5013);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (420, 'Benjamin', 'TcxtGtG', 'vMvuAG', 'bporterbn@bloglines.com', 0, 0, 9775);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (421, 'Robert', '5RSIwPYX2l7l', 'u5b8tzE2h', 'rhughesbo@ucoz.ru', 1, 0, 8793);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (422, 'Jose', '4oSv6Hi6', 'jOhmeW', 'jparkerbp@tiny.cc', 1, 2, 7487);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (423, 'Douglas', 'Bdp4JgrD', 'CzR3f2iFo7P6', 'dmurraybq@weebly.com', 1, 1, 2399);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (424, 'Elizabeth', '4cRGYpDrI6', 'M7MvexiCU', 'ewagnerbr@rakuten.co.jp', 1, 1, 7971);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (425, 'Ronald', 'B4mJSoJcoJ3W', 'MF3xEfnjMiWp', 'rfloresbs@1688.com', 1, 1, 2384);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (426, 'Evelyn', 'ON61P2Mtblq', 'ewKvn8CKFBe', 'ewatkinsbt@scientificamerican.com', 1, 1, 9264);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (427, 'Carolyn', 'K8pw6B78XHgP', 't5wIbEGCuHIm', 'cmcdonaldbu@4shared.com', 0, 1, 3633);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (428, 'Paul', 'GVD1begxRR', 'TtFwmFhon', 'phudsonbv@whitehouse.gov', 0, 0, 6157);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (429, 'Scott', 'NGwxYYr9iFL', 'baGHSDw6i', 'sthompsonbw@omniture.com', 0, 1, 8092);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (430, 'Jane', 'gP03Bww2uqK9', 'pcfj8x', 'jgordonbx@epa.gov', 1, 2, 7761);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (431, 'Harry', 'zGoYu4e', 'PpApzCNetfk', 'hgonzalezby@seattletimes.com', 1, 2, 6648);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (432, 'Scott', 'Wc3hCbjmY8L', 'F5gFW2', 'sburkebz@dropbox.com', 1, 0, 5042);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (433, 'Dennis', 'PFGyAR', 'aiQFHG0mJKD', 'dspencerc0@1688.com', 1, 2, 9126);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (434, 'Laura', 'ijCIfBbqg', 'QqozLDV1kEc', 'lbradleyc1@lycos.com', 0, 1, 7035);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (435, 'Paula', 'IxkIqKHIh3', '06S2FmkWZ', 'psimmonsc2@un.org', 0, 2, 8573);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (436, 'Scott', 's2ykYUvrZ', 'QWOL8Q5Z', 'swardc3@ebay.co.uk', 1, 0, 1304);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (437, 'Denise', 'yQiWyP9T466', 'W0746KuHa', 'ddavisc4@prweb.com', 0, 0, 2505);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (438, 'Edward', 'i24IICScO', 'p0mqdFKGNFD', 'ecampbellc5@tuttocitta.it', 1, 1, 2846);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (439, 'Daniel', 'yqmO6kP5kja', 'De2vlCgTL1', 'dwestc6@twitter.com', 1, 2, 6352);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (440, 'Dorothy', 'Ia130sH2', 'V2HASGvf', 'dlopezc7@blogger.com', 1, 0, 6790);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (441, 'Carlos', 'azeIpX', '9WADUtNUJqw', 'cmarshallc8@mediafire.com', 0, 2, 8504);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (442, 'Anne', '7rUvYN', 'rrrlyu1ae3X', 'athompsonc9@soundcloud.com', 0, 1, 5693);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (443, 'Julie', 'Zyg0W2yf', 'slKN6R', 'jknightca@ucla.edu', 0, 1, 2382);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (444, 'Louise', '6rXzvVGS', '6e0uMtaFLa3m', 'lriveracb@businesswire.com', 1, 0, 6805);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (445, 'Walter', 'Y2RNo0', 'w1npgkqC', 'wfishercc@springer.com', 0, 2, 5168);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (446, 'Norma', 'nzqqMpxkEKtC', 'ExoIW9KgUig', 'nclarkcd@yolasite.com', 0, 1, 5574);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (447, 'Gloria', 'Nxlfk8TgX', '463R2yfU', 'gmorenoce@nydailynews.com', 1, 1, 9745);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (448, 'Stephen', 'mofE80', 'AcDttf', 'swilliamsoncf@narod.ru', 0, 2, 1536);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (449, 'Jeffrey', 'yPQBTK8xWLx', 'OalN7n8', 'jfowlercg@comcast.net', 0, 2, 1300);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (450, 'Diane', 'WzQkaawk2zJ', '1iTkxC86c', 'dharveych@linkedin.com', 0, 0, 3647);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (451, 'Diana', 'EkRIvH', '1FozH4W', 'dramirezci@jigsy.com', 0, 2, 4131);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (452, 'Benjamin', 'omEluPAC2B', 'aOiEa5A355M', 'bfranklincj@github.io', 1, 2, 3425);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (453, 'Laura', 'Y0oZH3', 'vqKfJwy', 'lrussellck@unesco.org', 1, 1, 9318);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (454, 'Roger', 'wkyV0S9ZP', 'CG0ep2nCeV', 'rcarrollcl@economist.com', 1, 2, 7427);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (455, 'Alice', 'qzpUsNR', 'frFXg2PtGbjD', 'ahernandezcm@timesonline.co.uk', 1, 0, 2476);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (456, 'Cheryl', 'fVNBm44', '6fVffEQCH2E', 'ccunninghamcn@vk.com', 1, 0, 9585);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (457, 'Bobby', 'Ynhtx6mWLLw', 'UXYJWpDq', 'bcunninghamco@tinypic.com', 1, 2, 6328);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (458, 'Mary', 'PL12Zjon', 'hUEyb6BIdOz', 'msimscp@ca.gov', 1, 0, 5836);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (459, 'Kimberly', '8uRBlE7rBI', 'qLK8sk', 'kfraziercq@salon.com', 0, 0, 2995);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (460, 'Arthur', 'WM4kBZK', 'wggRtZtc', 'ascottcr@sourceforge.net', 1, 0, 1179);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (461, 'Mark', 'IcmElMTUYa3k', '2kdHn201KzAP', 'myoungcs@washingtonpost.com', 0, 1, 1784);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (462, 'Susan', 'EVQpw5d', 'jXVRBb', 'sduncanct@vkontakte.ru', 1, 2, 5567);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (463, 'Johnny', '18S0dhwmV', 'Ct88QXdo', 'jdunncu@unblog.fr', 0, 1, 5657);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (464, 'Kathryn', 'zdbIPkOiAsb', 'ejYHpcqJw', 'ksnydercv@dion.ne.jp', 0, 1, 9108);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (465, 'Donna', 'NBD2QCGPGx', 'NUfnRHyAI8C', 'dolivercw@free.fr', 0, 1, 8134);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (466, 'Joshua', 'ThyleKv', 'IHbBOmau', 'jhuntcx@webs.com', 0, 2, 6719);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (467, 'Rachel', '5A5EtXuz', 'ukUM4w7', 'rstewartcy@utexas.edu', 0, 0, 1079);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (468, 'Kathleen', 'TZ2EVuvHNM', 'HeOgC8fz', 'kschmidtcz@hexun.com', 0, 1, 28);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (469, 'Edward', 'FwU284MEoiP6', 'XTKgiO5w', 'eweaverd0@pcworld.com', 0, 0, 4211);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (470, 'Susan', 'OYOTY9GbZ', 'rOVijd5IfaKD', 'sdayd1@taobao.com', 0, 0, 9754);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (471, 'Elizabeth', 'rpFlCETjn', 'MQe5kYpDtqW8', 'echavezd2@epa.gov', 0, 1, 7809);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (472, 'Clarence', 'MAmH8CCteic', '5WiZ9K1w', 'clawrenced3@dell.com', 1, 1, 6189);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (473, 'Ashley', '2z0nu2t', 'BB2urrSAq0', 'aallend4@instagram.com', 1, 1, 7624);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (474, 'Jerry', 'Mpomve', '077jFbC', 'jpetersd5@friendfeed.com', 0, 0, 211);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (475, 'Lawrence', '5rfKrM2I', 'VdhXNXZk3UU', 'llongd6@foxnews.com', 1, 2, 7729);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (476, 'Jacqueline', 'U3n7VR2yvb', 'GkSIQ2o', 'jmillerd7@prnewswire.com', 0, 1, 2119);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (477, 'Jerry', 'G43J0f', 'GIZognK', 'jhartd8@theguardian.com', 0, 1, 2477);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (478, 'Elizabeth', 'A9NnjopJj', 'RQXEVCx7', 'eknightd9@weather.com', 0, 0, 1555);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (479, 'Andrew', '6T8igASgq8f', 'b3Dv5mKd', 'abellda@chicagotribune.com', 0, 0, 2632);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (480, 'Edward', 'f93gOn0pK', 'hhiZMeIYSeJG', 'evasquezdb@angelfire.com', 0, 1, 3894);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (481, 'Marilyn', 'RYpqaTb3', 'MzeyYxa78', 'mbrowndc@mac.com', 0, 1, 9793);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (482, 'Cynthia', 'hWf8nX0XG', 'NHplXoNnx8F', 'crobertsondd@ft.com', 0, 1, 9276);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (483, 'Jonathan', 'QAZoGmVvIi', 'TsOi61', 'jcookde@networksolutions.com', 0, 0, 9634);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (484, 'Ruby', 'mDXmfSz', 'zhnyIeaLY14', 'rjordandf@technorati.com', 1, 0, 9754);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (485, 'Christina', 'OF4ydwbm', 'ibIHK04T8J', 'ckingdg@cpanel.net', 1, 2, 350);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (486, 'Dorothy', 'fFDt7Rwnw', 'QvHsy5mrONY', 'dsmithdh@opera.com', 0, 1, 9679);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (487, 'Linda', '4nxN4rEApY8', 'GRUBVq', 'lfloresdi@ustream.tv', 1, 1, 6116);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (488, 'Teresa', 'bKz4TN9Zevrs', '50LJoc', 'tcoxdj@macromedia.com', 1, 1, 8296);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (489, 'Alice', 'ZVyfOmqju', 'njyvtmrnKB', 'aberrydk@smh.com.au', 1, 0, 4073);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (490, 'Samuel', 'MKVKRdVlKA', 'KzcWcSvQ', 'spaynedl@businessweek.com', 1, 2, 3419);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (491, 'Rose', '36iB3sHD', 'PVQz7y6MCi', 'rkellydm@t-online.de', 0, 1, 2357);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (492, 'Charles', '8jg9RT3rj5d', '2UGzeLhhdM', 'cschmidtdn@indiegogo.com', 1, 2, 766);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (493, 'Margaret', 'NkqmBsn6yU', 'WhYvui3', 'mlongdo@ca.gov', 0, 1, 7205);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (494, 'Louise', '78XAaolYXY', 'Y0y9ABGQN', 'lramosdp@bloglines.com', 1, 2, 569);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (495, 'George', 'vYpox5Qfb9', 'Tb40VFBL', 'ghansendq@fastcompany.com', 0, 2, 6768);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (496, 'Gary', 'ycp7WUOlBvU0', 'SIL2yvdT', 'gcooperdr@bloglines.com', 1, 0, 4090);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (497, 'Judith', 'bWoCEXcZ1', 'OcUggb5R', 'jrobinsonds@cpanel.net', 1, 0, 9486);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (498, 'Frances', 'fa05MZtkYbW', 'MA9aOTvTLCc', 'fmendozadt@lulu.com', 1, 1, 4612);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (499, 'Anthony', '0QzQzilILBo', 'RqdHOdl', 'aarnolddu@tumblr.com', 1, 0, 9210);
        insert into User (user_id, username, password, salt, email, sex, goal, exp) values (500, 'Ralph', 'Uz9fDgy4n3l', 'sJKCRhwlY', 'rwillisdv@apple.com', 0, 0, 5853);

        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (1, 894, 1001, 653, 204, 1163, 1004);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (2, 905, 860, 955, 952, 254, 694);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (3, 836, 71, 1181, 567, 1248, 375);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (4, 275, 570, 706, 751, 69, 331);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (5, 22, 925, 395, 897, 435, 682);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (6, 280, 1124, 61, 689, 300, 908);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (7, 838, 964, 1016, 231, 547, 529);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (8, 1227, 1049, 20, 1131, 722, 808);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (9, 364, 430, 487, 204, 881, 405);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (10, 679, 580, 1204, 1111, 1176, 1210);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (11, 964, 28, 202, 255, 1137, 767);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (12, 1035, 1219, 826, 762, 599, 686);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (13, 841, 921, 716, 555, 611, 647);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (14, 65, 1042, 575, 1233, 927, 595);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (15, 393, 111, 850, 184, 398, 770);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (16, 1121, 602, 365, 202, 116, 187);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (17, 50, 457, 911, 200, 167, 113);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (18, 938, 520, 27, 229, 842, 261);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (19, 290, 511, 518, 1018, 847, 322);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (20, 1232, 264, 725, 1070, 160, 889);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (21, 274, 1069, 530, 276, 365, 342);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (22, 926, 372, 439, 589, 1189, 1116);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (23, 952, 402, 244, 397, 285, 696);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (24, 884, 331, 728, 57, 306, 32);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (25, 51, 38, 1159, 250, 606, 761);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (26, 319, 742, 1002, 1043, 371, 673);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (27, 1199, 504, 250, 475, 336, 174);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (28, 681, 239, 200, 379, 616, 468);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (29, 186, 307, 499, 1223, 1026, 181);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (30, 708, 1130, 729, 226, 441, 501);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (31, 856, 835, 381, 558, 301, 200);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (32, 201, 284, 293, 553, 229, 892);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (33, 615, 268, 1081, 718, 393, 1029);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (34, 471, 1145, 658, 352, 1222, 556);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (35, 578, 1169, 1139, 434, 447, 562);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (36, 4, 702, 1231, 933, 152, 423);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (37, 223, 743, 143, 518, 963, 1181);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (38, 670, 641, 1228, 399, 568, 1231);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (39, 1144, 540, 854, 799, 433, 481);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (40, 374, 315, 317, 1208, 611, 292);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (41, 126, 584, 99, 95, 615, 965);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (42, 919, 174, 157, 475, 172, 794);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (43, 971, 375, 789, 647, 614, 90);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (44, 1135, 678, 308, 43, 252, 747);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (45, 50, 59, 686, 380, 508, 840);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (46, 584, 274, 1074, 38, 410, 435);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (47, 783, 679, 1102, 1222, 637, 1125);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (48, 532, 894, 1232, 842, 770, 371);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (49, 173, 286, 1054, 1117, 914, 1104);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (50, 246, 695, 932, 500, 557, 537);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (51, 13, 1085, 117, 1036, 944, 1059);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (52, 437, 150, 1019, 31, 1065, 363);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (53, 804, 1035, 1177, 51, 764, 1049);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (54, 790, 266, 88, 132, 445, 1109);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (55, 525, 98, 1191, 196, 126, 161);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (56, 323, 1102, 723, 1009, 1026, 159);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (57, 622, 195, 278, 135, 200, 1225);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (58, 512, 82, 1152, 783, 1084, 980);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (59, 462, 631, 187, 604, 1248, 448);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (60, 682, 1077, 261, 553, 1046, 838);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (61, 157, 781, 504, 599, 54, 1091);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (62, 718, 173, 472, 392, 542, 462);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (63, 143, 344, 560, 319, 708, 1215);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (64, 419, 905, 433, 910, 742, 864);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (65, 501, 926, 427, 862, 208, 900);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (66, 243, 1223, 53, 59, 855, 829);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (67, 632, 1078, 528, 1024, 271, 72);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (68, 788, 965, 28, 1142, 814, 739);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (69, 448, 433, 89, 638, 1047, 358);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (70, 1200, 434, 968, 18, 524, 1138);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (71, 1174, 710, 296, 152, 566, 407);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (72, 617, 95, 643, 963, 1119, 1000);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (73, 566, 548, 976, 1209, 751, 763);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (74, 1081, 578, 869, 451, 55, 1092);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (75, 594, 988, 838, 845, 1130, 140);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (76, 1147, 972, 1082, 938, 938, 198);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (77, 299, 639, 702, 542, 898, 1139);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (78, 344, 121, 46, 728, 598, 456);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (79, 20, 1232, 261, 732, 722, 1197);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (80, 359, 50, 727, 220, 287, 220);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (81, 404, 626, 797, 1075, 238, 881);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (82, 348, 326, 295, 919, 369, 137);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (83, 429, 478, 588, 592, 725, 548);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (84, 706, 855, 93, 985, 1116, 1164);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (85, 359, 592, 458, 995, 1026, 391);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (86, 604, 25, 88, 710, 886, 783);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (87, 557, 176, 386, 305, 312, 1064);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (88, 1237, 162, 1043, 1136, 608, 642);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (89, 634, 738, 241, 272, 473, 954);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (90, 566, 674, 559, 829, 1103, 1060);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (91, 909, 786, 1249, 521, 480, 378);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (92, 486, 1170, 1112, 0, 508, 519);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (93, 165, 459, 1139, 768, 164, 421);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (94, 496, 923, 866, 710, 1248, 405);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (95, 361, 335, 90, 776, 816, 719);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (96, 1159, 298, 1182, 455, 842, 96);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (97, 134, 1128, 643, 212, 25, 280);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (98, 207, 405, 971, 206, 302, 64);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (99, 1091, 342, 102, 1149, 1205, 1177);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (100, 717, 683, 368, 434, 390, 1223);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (101, 46, 1077, 317, 212, 741, 1014);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (102, 463, 473, 160, 617, 264, 740);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (103, 575, 1090, 65, 834, 120, 950);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (104, 512, 322, 545, 259, 296, 815);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (105, 580, 1071, 820, 43, 731, 514);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (106, 242, 1009, 530, 527, 22, 497);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (107, 46, 130, 214, 756, 684, 133);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (108, 1205, 628, 565, 588, 968, 154);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (109, 365, 211, 704, 415, 848, 751);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (110, 0, 84, 597, 143, 1210, 1070);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (111, 564, 179, 838, 890, 606, 189);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (112, 800, 711, 900, 1025, 1016, 740);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (113, 767, 370, 702, 186, 335, 239);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (114, 532, 1115, 472, 1120, 832, 201);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (115, 863, 669, 616, 689, 444, 965);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (116, 598, 122, 782, 156, 513, 513);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (117, 764, 704, 1145, 588, 785, 772);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (118, 898, 21, 128, 335, 708, 1121);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (119, 565, 137, 1229, 596, 1237, 766);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (120, 54, 1090, 1242, 213, 213, 1097);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (121, 247, 1018, 161, 172, 440, 229);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (122, 970, 825, 488, 1236, 927, 30);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (123, 354, 334, 95, 1081, 1108, 387);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (124, 868, 239, 1014, 59, 1171, 20);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (125, 678, 888, 383, 264, 528, 930);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (126, 1103, 515, 1109, 49, 188, 1204);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (127, 106, 608, 33, 537, 1097, 942);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (128, 537, 1117, 1099, 1159, 1210, 502);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (129, 876, 717, 595, 1219, 294, 300);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (130, 123, 80, 164, 449, 26, 36);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (131, 1, 287, 334, 688, 632, 421);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (132, 1249, 287, 503, 126, 1218, 639);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (133, 462, 512, 450, 810, 1234, 130);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (134, 382, 1160, 1106, 617, 352, 190);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (135, 95, 422, 954, 719, 39, 573);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (136, 493, 1136, 225, 12, 781, 1054);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (137, 316, 396, 1215, 1062, 459, 393);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (138, 1128, 920, 1136, 1010, 874, 1099);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (139, 618, 1057, 1082, 866, 1154, 1202);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (140, 785, 471, 1116, 910, 88, 859);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (141, 1242, 310, 120, 748, 21, 440);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (142, 724, 1068, 13, 462, 855, 1075);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (143, 1007, 775, 926, 768, 534, 1136);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (144, 427, 386, 738, 992, 899, 1082);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (145, 793, 887, 1108, 583, 1074, 341);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (146, 38, 1012, 588, 731, 936, 62);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (147, 367, 446, 950, 254, 818, 1019);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (148, 1110, 818, 211, 932, 65, 556);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (149, 24, 954, 862, 719, 1115, 710);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (150, 580, 460, 586, 792, 901, 991);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (151, 1073, 160, 82, 904, 225, 1230);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (152, 1171, 12, 332, 508, 742, 427);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (153, 46, 683, 1103, 309, 1013, 671);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (154, 168, 903, 1202, 579, 413, 1025);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (155, 528, 323, 957, 1131, 904, 843);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (156, 641, 248, 365, 165, 548, 867);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (157, 845, 130, 1047, 60, 1146, 942);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (158, 1015, 388, 1240, 161, 629, 728);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (159, 89, 626, 196, 1142, 1131, 908);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (160, 500, 1186, 1119, 308, 807, 797);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (161, 957, 1180, 599, 390, 57, 375);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (162, 631, 477, 931, 1072, 788, 1227);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (163, 215, 899, 212, 783, 720, 445);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (164, 121, 919, 762, 1156, 826, 424);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (165, 20, 632, 586, 513, 349, 466);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (166, 273, 376, 965, 1012, 607, 542);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (167, 317, 960, 1064, 1045, 981, 757);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (168, 1049, 656, 605, 81, 135, 471);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (169, 1224, 1154, 309, 939, 609, 1179);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (170, 121, 332, 1196, 9, 551, 365);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (171, 344, 196, 234, 735, 471, 619);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (172, 685, 345, 684, 388, 914, 1205);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (173, 340, 226, 1188, 348, 640, 840);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (174, 959, 172, 1059, 1223, 1166, 37);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (175, 1104, 58, 510, 455, 505, 907);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (176, 1081, 168, 102, 1137, 350, 146);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (177, 1200, 838, 789, 158, 551, 1076);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (178, 342, 616, 517, 1068, 332, 357);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (179, 938, 670, 665, 875, 809, 358);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (180, 275, 1093, 314, 119, 258, 194);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (181, 1189, 614, 536, 822, 401, 1144);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (182, 294, 1155, 715, 478, 1211, 981);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (183, 1182, 465, 1018, 336, 578, 7);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (184, 947, 715, 715, 521, 631, 270);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (185, 1195, 725, 1201, 99, 1112, 889);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (186, 893, 516, 710, 785, 671, 1022);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (187, 1100, 265, 119, 223, 586, 1082);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (188, 273, 434, 483, 115, 641, 881);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (189, 1132, 1096, 504, 1075, 41, 1236);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (190, 127, 647, 705, 665, 874, 86);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (191, 300, 210, 269, 629, 427, 455);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (192, 639, 1203, 1, 54, 1040, 115);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (193, 778, 255, 320, 980, 912, 903);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (194, 390, 478, 8, 870, 564, 901);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (195, 1157, 934, 215, 188, 346, 629);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (196, 789, 665, 1040, 625, 1126, 277);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (197, 617, 1171, 505, 34, 1166, 871);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (198, 618, 11, 183, 742, 897, 1007);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (199, 303, 1076, 400, 108, 938, 97);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (200, 805, 1005, 880, 1197, 804, 4);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (201, 850, 966, 327, 70, 471, 1104);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (202, 8, 164, 941, 1160, 414, 870);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (203, 138, 719, 1164, 780, 291, 267);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (204, 484, 870, 76, 37, 925, 888);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (205, 420, 587, 525, 382, 321, 17);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (206, 161, 597, 158, 113, 436, 524);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (207, 204, 421, 865, 753, 909, 819);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (208, 1135, 121, 247, 616, 1174, 923);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (209, 862, 517, 1208, 504, 634, 1175);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (210, 960, 276, 318, 598, 1226, 588);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (211, 274, 603, 773, 617, 44, 1213);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (212, 180, 39, 817, 1145, 427, 850);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (213, 371, 766, 966, 990, 440, 1059);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (214, 302, 1134, 226, 254, 1111, 68);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (215, 319, 1098, 319, 1191, 1180, 220);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (216, 1249, 580, 1065, 822, 568, 609);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (217, 1111, 719, 357, 516, 1116, 443);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (218, 1232, 1082, 1190, 767, 600, 52);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (219, 1120, 1104, 1230, 1112, 92, 315);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (220, 764, 539, 634, 888, 692, 994);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (221, 1112, 484, 1065, 42, 590, 1109);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (222, 22, 766, 1118, 878, 1191, 645);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (223, 957, 977, 290, 189, 596, 272);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (224, 667, 433, 77, 74, 805, 927);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (225, 211, 140, 849, 532, 1068, 746);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (226, 106, 1154, 306, 800, 407, 1167);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (227, 1016, 1044, 1093, 234, 1118, 246);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (228, 555, 200, 147, 459, 432, 861);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (229, 92, 618, 286, 1218, 227, 32);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (230, 739, 430, 708, 419, 540, 1201);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (231, 310, 788, 299, 883, 899, 63);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (232, 101, 1008, 316, 957, 197, 108);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (233, 820, 544, 794, 731, 289, 413);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (234, 1091, 978, 324, 164, 674, 293);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (235, 302, 503, 815, 385, 459, 251);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (236, 901, 814, 843, 615, 84, 1060);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (237, 651, 829, 104, 390, 85, 677);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (238, 372, 935, 1079, 471, 1048, 235);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (239, 304, 936, 840, 357, 204, 533);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (240, 1179, 1132, 1046, 502, 57, 615);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (241, 1062, 226, 135, 1173, 495, 118);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (242, 1233, 353, 168, 685, 81, 1243);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (243, 338, 1074, 177, 779, 433, 41);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (244, 1234, 719, 825, 481, 996, 778);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (245, 596, 830, 965, 623, 303, 280);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (246, 285, 455, 629, 295, 723, 1117);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (247, 1157, 1164, 550, 148, 954, 1025);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (248, 735, 400, 154, 1005, 615, 545);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (249, 767, 1104, 650, 903, 190, 18);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (250, 595, 850, 194, 446, 1135, 732);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (251, 116, 144, 701, 643, 34, 976);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (252, 154, 844, 1089, 627, 66, 18);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (253, 30, 34, 208, 772, 696, 432);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (254, 166, 581, 657, 332, 191, 291);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (255, 1077, 897, 334, 1139, 37, 1071);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (256, 190, 1014, 920, 113, 468, 742);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (257, 400, 756, 609, 834, 542, 426);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (258, 1201, 757, 883, 418, 1134, 221);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (259, 1246, 281, 1146, 1211, 52, 93);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (260, 59, 1226, 749, 101, 183, 951);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (261, 850, 640, 944, 38, 511, 70);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (262, 99, 891, 990, 638, 625, 471);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (263, 541, 729, 43, 1150, 776, 501);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (264, 825, 287, 380, 8, 1055, 98);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (265, 1049, 893, 527, 1152, 646, 313);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (266, 324, 924, 926, 1211, 1096, 1056);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (267, 162, 17, 573, 145, 148, 29);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (268, 1199, 1239, 859, 866, 766, 406);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (269, 80, 673, 756, 335, 824, 566);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (270, 1144, 445, 797, 1194, 264, 151);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (271, 225, 866, 483, 18, 527, 254);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (272, 254, 1052, 42, 113, 1223, 510);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (273, 638, 190, 315, 670, 478, 784);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (274, 572, 330, 373, 62, 840, 926);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (275, 365, 183, 93, 545, 162, 738);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (276, 3, 278, 324, 11, 1067, 86);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (277, 147, 1154, 546, 75, 675, 198);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (278, 189, 1239, 894, 700, 703, 1062);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (279, 863, 1045, 160, 332, 88, 685);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (280, 800, 308, 563, 733, 468, 171);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (281, 481, 879, 417, 79, 168, 909);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (282, 1214, 565, 186, 1030, 1066, 1067);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (283, 411, 1100, 425, 403, 373, 187);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (284, 1095, 1157, 778, 569, 194, 983);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (285, 904, 1083, 646, 961, 1006, 1161);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (286, 693, 620, 393, 167, 1001, 822);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (287, 334, 97, 564, 686, 853, 748);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (288, 1174, 306, 1237, 882, 1045, 37);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (289, 504, 841, 308, 217, 484, 187);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (290, 992, 546, 269, 899, 487, 646);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (291, 921, 851, 902, 595, 284, 525);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (292, 41, 865, 719, 627, 285, 554);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (293, 1191, 204, 586, 3, 395, 462);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (294, 356, 622, 1213, 571, 372, 1169);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (295, 457, 826, 1148, 430, 755, 1038);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (296, 745, 1012, 873, 1231, 86, 873);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (297, 295, 790, 137, 1177, 359, 872);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (298, 370, 547, 1132, 194, 927, 932);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (299, 799, 533, 30, 658, 1173, 559);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (300, 377, 1201, 1202, 957, 142, 315);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (301, 1012, 654, 239, 505, 415, 884);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (302, 302, 301, 493, 306, 765, 1239);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (303, 431, 1189, 531, 517, 1037, 1056);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (304, 79, 1044, 435, 102, 392, 69);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (305, 830, 712, 841, 1021, 1003, 615);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (306, 356, 56, 361, 972, 847, 553);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (307, 1173, 604, 818, 935, 168, 422);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (308, 369, 799, 970, 560, 1237, 752);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (309, 413, 677, 263, 844, 1117, 190);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (310, 647, 887, 46, 789, 123, 477);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (311, 257, 1099, 420, 718, 151, 131);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (312, 100, 543, 1116, 1023, 1084, 419);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (313, 803, 508, 214, 827, 299, 337);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (314, 372, 395, 362, 859, 875, 144);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (315, 328, 1231, 707, 971, 350, 924);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (316, 1171, 428, 1036, 519, 997, 650);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (317, 119, 1023, 321, 634, 1250, 6);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (318, 860, 440, 766, 580, 555, 722);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (319, 623, 878, 261, 700, 68, 692);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (320, 672, 1025, 1082, 152, 720, 424);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (321, 199, 1169, 816, 656, 775, 78);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (322, 997, 123, 573, 978, 1016, 492);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (323, 778, 706, 1194, 57, 322, 873);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (324, 486, 863, 128, 753, 385, 222);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (325, 1038, 375, 510, 146, 16, 1126);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (326, 1083, 421, 895, 1181, 969, 888);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (327, 543, 107, 576, 34, 821, 1145);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (328, 750, 1081, 643, 908, 1144, 1072);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (329, 488, 182, 694, 1147, 241, 727);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (330, 927, 632, 935, 270, 15, 1171);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (331, 352, 301, 228, 314, 1044, 347);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (332, 626, 996, 522, 545, 185, 887);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (333, 996, 470, 664, 370, 560, 90);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (334, 241, 1223, 950, 1159, 963, 417);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (335, 23, 781, 906, 220, 156, 823);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (336, 981, 998, 60, 926, 724, 146);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (337, 592, 788, 1127, 566, 5, 501);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (338, 102, 582, 375, 264, 1071, 43);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (339, 800, 702, 891, 523, 1120, 557);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (340, 221, 954, 536, 303, 663, 586);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (341, 757, 1241, 904, 724, 59, 322);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (342, 496, 942, 1022, 84, 866, 563);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (343, 356, 770, 435, 806, 684, 554);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (344, 544, 1239, 336, 1097, 363, 709);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (345, 1008, 386, 247, 685, 286, 1118);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (346, 538, 810, 996, 1245, 894, 622);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (347, 279, 332, 248, 1101, 744, 1064);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (348, 440, 227, 980, 181, 956, 17);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (349, 98, 173, 646, 1229, 493, 372);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (350, 765, 552, 287, 1039, 138, 697);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (351, 951, 378, 501, 370, 852, 456);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (352, 22, 1124, 1150, 443, 144, 574);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (353, 868, 486, 298, 227, 322, 627);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (354, 110, 476, 1129, 842, 739, 445);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (355, 111, 530, 563, 125, 1052, 609);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (356, 603, 377, 371, 712, 202, 877);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (357, 686, 283, 826, 182, 907, 897);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (358, 454, 707, 1170, 22, 981, 780);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (359, 279, 1222, 681, 500, 163, 444);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (360, 170, 215, 40, 351, 294, 1179);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (361, 198, 131, 1204, 199, 1195, 675);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (362, 806, 658, 275, 535, 596, 792);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (363, 1107, 405, 655, 1102, 1223, 37);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (364, 564, 631, 537, 467, 183, 255);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (365, 907, 275, 749, 1187, 989, 1177);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (366, 421, 32, 475, 162, 711, 1030);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (367, 565, 1114, 1221, 822, 864, 1025);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (368, 347, 991, 1191, 269, 556, 1105);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (369, 83, 450, 1192, 146, 299, 611);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (370, 470, 428, 972, 803, 3, 274);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (371, 742, 878, 841, 768, 487, 793);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (372, 569, 740, 412, 279, 17, 787);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (373, 318, 1236, 1181, 989, 965, 217);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (374, 1000, 1189, 1138, 194, 1248, 717);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (375, 25, 34, 1192, 1030, 1196, 996);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (376, 1119, 852, 1148, 943, 1092, 798);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (377, 488, 126, 998, 220, 216, 164);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (378, 400, 513, 378, 1024, 906, 71);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (379, 748, 1056, 1208, 1083, 110, 1198);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (380, 1206, 99, 837, 912, 504, 994);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (381, 679, 941, 571, 952, 914, 25);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (382, 781, 1039, 1182, 1183, 450, 445);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (383, 660, 941, 12, 11, 1198, 290);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (384, 652, 975, 1088, 715, 437, 699);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (385, 674, 1168, 414, 1072, 314, 932);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (386, 1062, 540, 898, 734, 691, 876);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (387, 1157, 1063, 851, 688, 795, 208);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (388, 346, 1001, 812, 566, 1131, 383);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (389, 345, 1089, 1222, 1048, 425, 743);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (390, 387, 419, 1024, 626, 85, 779);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (391, 830, 495, 130, 933, 562, 430);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (392, 836, 506, 593, 1085, 1093, 329);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (393, 26, 34, 592, 183, 1236, 380);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (394, 431, 494, 1020, 168, 292, 1016);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (395, 775, 429, 1090, 207, 493, 1144);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (396, 442, 24, 1024, 861, 663, 527);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (397, 903, 840, 113, 827, 428, 506);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (398, 16, 908, 1086, 536, 238, 690);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (399, 997, 819, 1234, 878, 354, 531);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (400, 497, 1210, 988, 1225, 1070, 1020);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (401, 472, 1117, 954, 1015, 1167, 425);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (402, 157, 1192, 504, 386, 304, 924);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (403, 986, 1247, 631, 1217, 817, 2);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (404, 523, 973, 1021, 402, 834, 225);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (405, 609, 759, 180, 866, 939, 354);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (406, 1100, 765, 31, 546, 1247, 133);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (407, 722, 1078, 309, 608, 628, 1125);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (408, 281, 1243, 321, 145, 414, 575);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (409, 960, 816, 803, 70, 340, 607);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (410, 1013, 424, 608, 101, 993, 35);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (411, 99, 72, 88, 497, 84, 671);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (412, 26, 593, 765, 1139, 464, 938);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (413, 804, 1122, 464, 1055, 744, 417);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (414, 263, 1210, 429, 601, 806, 570);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (415, 916, 1056, 166, 667, 477, 1073);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (416, 806, 255, 892, 647, 1196, 1048);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (417, 207, 1070, 169, 219, 358, 84);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (418, 389, 971, 241, 910, 155, 907);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (419, 11, 477, 598, 150, 29, 27);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (420, 645, 360, 489, 203, 393, 711);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (421, 297, 960, 396, 843, 378, 234);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (422, 579, 790, 95, 917, 89, 64);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (423, 72, 360, 1034, 627, 473, 1194);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (424, 170, 832, 1156, 1129, 646, 212);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (425, 304, 625, 530, 899, 1042, 1035);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (426, 879, 665, 1176, 1141, 1170, 596);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (427, 473, 624, 197, 294, 1035, 480);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (428, 277, 217, 1177, 346, 399, 185);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (429, 478, 721, 117, 670, 36, 993);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (430, 811, 436, 992, 860, 880, 308);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (431, 896, 444, 317, 224, 579, 12);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (432, 492, 44, 684, 474, 658, 351);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (433, 864, 292, 611, 486, 926, 121);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (434, 798, 7, 1177, 1224, 549, 22);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (435, 1218, 765, 415, 683, 214, 143);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (436, 771, 1183, 1055, 473, 836, 785);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (437, 67, 369, 1020, 721, 227, 321);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (438, 48, 476, 582, 272, 1211, 667);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (439, 706, 494, 632, 754, 547, 689);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (440, 724, 695, 383, 940, 229, 820);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (441, 893, 984, 49, 283, 172, 1121);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (442, 571, 891, 377, 253, 182, 1038);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (443, 1219, 1112, 919, 136, 343, 1215);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (444, 726, 357, 645, 523, 780, 478);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (445, 1156, 618, 1235, 1201, 642, 89);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (446, 814, 96, 1050, 985, 632, 856);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (447, 714, 859, 1242, 775, 23, 954);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (448, 688, 454, 1247, 336, 358, 961);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (449, 366, 1081, 1179, 755, 995, 73);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (450, 122, 617, 1250, 91, 723, 322);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (451, 1108, 577, 304, 149, 1025, 549);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (452, 207, 1195, 418, 122, 914, 591);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (453, 11, 682, 32, 443, 532, 48);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (454, 1217, 191, 509, 256, 810, 391);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (455, 239, 1181, 837, 465, 256, 350);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (456, 1086, 601, 532, 566, 950, 425);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (457, 483, 1040, 98, 59, 904, 1017);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (458, 353, 190, 682, 453, 1208, 717);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (459, 836, 934, 636, 64, 198, 1160);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (460, 90, 588, 298, 201, 610, 991);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (461, 682, 662, 857, 147, 955, 804);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (462, 169, 1129, 23, 328, 118, 318);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (463, 218, 1198, 487, 922, 297, 682);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (464, 850, 221, 1189, 175, 582, 671);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (465, 77, 258, 326, 1034, 670, 362);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (466, 1178, 810, 1107, 665, 902, 332);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (467, 550, 868, 1017, 149, 198, 744);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (468, 1190, 488, 416, 967, 119, 1117);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (469, 52, 108, 144, 509, 1016, 354);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (470, 1058, 1055, 536, 727, 455, 533);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (471, 299, 1053, 2, 433, 657, 134);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (472, 174, 97, 703, 837, 598, 683);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (473, 1126, 349, 385, 1168, 900, 153);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (474, 1210, 1054, 228, 272, 1107, 1045);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (475, 13, 896, 186, 919, 523, 853);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (476, 371, 420, 915, 875, 340, 5);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (477, 1197, 208, 722, 804, 572, 52);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (478, 967, 253, 705, 849, 875, 79);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (479, 1018, 559, 28, 533, 1188, 1238);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (480, 1027, 79, 171, 257, 143, 405);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (481, 692, 1011, 1219, 541, 125, 838);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (482, 1186, 1025, 699, 1084, 657, 733);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (483, 391, 464, 401, 82, 977, 459);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (484, 673, 1024, 187, 424, 174, 156);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (485, 738, 543, 497, 1129, 1144, 877);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (486, 574, 820, 1111, 298, 292, 940);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (487, 1144, 510, 86, 672, 835, 288);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (488, 1220, 268, 910, 754, 77, 815);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (489, 969, 534, 305, 1179, 111, 205);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (490, 971, 673, 1106, 524, 1157, 652);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (491, 213, 145, 617, 170, 39, 512);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (492, 928, 547, 511, 1164, 600, 449);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (493, 467, 1042, 335, 1041, 806, 261);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (494, 1213, 654, 1198, 71, 195, 539);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (495, 796, 575, 498, 1205, 878, 208);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (496, 879, 1056, 847, 954, 846, 325);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (497, 1090, 9, 1014, 123, 760, 439);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (498, 519, 1111, 1031, 490, 566, 1064);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (499, 1174, 1082, 770, 851, 899, 1137);
        insert into Points (User_user_id, cardio, arms, legs, back, shoulders, chest) values (500, 1247, 82, 68, 354, 63, 915);

        -- add workouts to Workout table
        INSERT INTO Workout (title, `desc`) VALUES ("Hammer Curls", "Stand up with your torso upright and a dumbbell on each hand being held at arms length. The elbows should be close to the torso.
        The palms of the hands should be facing your torso. This will be your starting position.
        Now, while holding your upper arm stationary, exhale and curl the weight forward while contracting the biceps. Continue to raise the weight until the biceps are fully contracted and the dumbbell is at shoulder level. Hold the contracted position for a brief moment as you squeeze the biceps. Tip: Focus on keeping the elbow stationary and only moving your forearm.
        After the brief pause, inhale and slowly begin the lower the dumbbells back down to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Bicep Curl", "Stand up straight with a dumbbell in each hand at arm's length. Keep your elbows close to your torso and rotate the palms of your hands until they are facing forward. This will be your starting position.
        Now, keeping the upper arms stationary, exhale and curl the weights while contracting your biceps. Continue to raise the weights until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a brief pause as you squeeze your biceps.
        Then, inhale and slowly begin to lower the dumbbells back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Curl", "Stand up with your torso upright while holding a barbell at a shoulder-width grip. The palm of your hands should be facing forward and the elbows should be close to the torso. This will be your starting position.
        While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move.
        Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard.
        Slowly begin to bring the bar back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bench Dips", "For this exercise you will need to place a bench behind your back. With the bench perpendicular to your body, and while looking away from it, hold on to the bench on its edge with the hands fully extended, separated at shoulder width. The legs will be extended forward, bent at the waist and perpendicular to your torso. This will be your starting position.
        Slowly lower your body as you inhale by bending at the elbows until you lower yourself far enough to where there is an angle slightly smaller than 90 degrees between the upper arm and the forearm. Tip: Keep the elbows as close as possible throughout the movement. Forearms should always be pointing down.
        Using your triceps to bring your torso up again, lift yourself back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bicep Curl to Shoulder Press", "For this exercise you will need to place a bench behind your back. With the bench perpendicular to your body, and while looking away from it, hold on to the bench on its edge with the hands fully extended, separated at shoulder width. The legs will be extended forward, bent at the waist and perpendicular to your torso. This will be your starting position.
        Slowly lower your body as you inhale by bending at the elbows until you lower yourself far enough to where there is an angle slightly smaller than 90 degrees between the upper arm and the forearm. Tip: Keep the elbows as close as possible throughout the movement. Forearms should always be pointing down.
        Using your triceps to bring your torso up again, lift yourself back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Body-Up", "Assume a plank position on the ground. You should be supporting your body weight on your toes and forearms keeping your torso straight. Your forearms should be shoulder-width apart. This will be your starting position.
        Pressing your palms firmly into the ground, extend through the elbows to raise your body from the ground. Keep your torso rigid as you perform the movement.
        Slowly lower your forearms back to the ground by allowing the elbows to flex. Repeat for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Triceps Extension", "With your right hand, grasp a single handle attached to the high-cable pulley using a supinated (underhand; palms facing up) grip. You should be standing directly in front of the weight stack.
        Now pull the handle down so that your upper arm and elbow are locked in to the side of your body. Your upper arm and forearm should form an acute angle (less than 90-degrees). You can keep the other arm by the waist and you can have one leg in front of you and the other one back for better balance. This will be your starting position.
        As you contract the triceps, move the single handle attachment down to your side until your arm is straight. Breathe out as you perform this movement. Tip: Only the forearms should move. Your upper arms should remain stationary at all times.
        Squeeze the triceps and hold for a second in this contracted position.
        Slowly return the handle to the starting position.
        Repeat for the recommended amount of repetitions and then perform the same movement with the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Preacher Curl", "Place a preacher bench about 2 feet in front of a pulley machine.
        Attach a straight bar to the low pulley.
        Sit at the preacher bench with your elbow and upper arms firmly on top of the bench pad and have someone hand you the bar from the low pulley.
        Grab the bar and fully extend your arms on top of the preacher bench pad. This will be your starting position.
        Now start pilling the weight up towards your shoulders and squeeze the biceps hard at the top of the movement. Exhale as you perform this motion. Also, hold for a second at the top.
        Now slowly lower the weight to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Wrist Curl", "Start out by placing a flat bench in front of a low pulley cable that has a straight bar attachment.
        Use your arms to grab the cable bar with a narrow to shoulder width supinated grip (palms up) and bring them up so that your forearms are resting against the top of your thighs. Your wrists should be hanging just beyond your knees.
        Start out by curling your wrist upwards and exhaling. Keep the contraction for a second.
        Slowly lower your wrists back down to the starting position while inhaling.
        Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Concentration Curls", "Sit down on a flat bench with one dumbbell in front of you between your legs. Your legs should be spread with your knees bent and feet on the floor.
        Use your right arm to pick the dumbbell up. Place the back of your right upper arm on the top of your inner right thigh. Rotate the palm of your hand until it is facing forward away from your thigh. Tip: Your arm should be extended and the dumbbell should be above the floor. This will be your starting position.
        While holding the upper arm stationary, curl the weights forward while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Tip: At the top of the movement make sure that the little finger of your arm is higher than your thumb. This guarantees a good contraction. Hold the contracted position for a second as you squeeze the biceps.
        Slowly begin to bring the dumbbells back to starting position as your breathe in. Caution: Avoid swinging motions at any time.
        Repeat for the recommended amount of repetitions. Then repeat the movement with the left arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dip Machine", "Sit securely in a dip machine, select the weight and firmly grasp the handles.
        Now keep your elbows in at your sides in order to place emphasis on the triceps. The elbows should be bent at a 90 degree angle.
        As you contract the triceps, extend your arms downwards as you exhale. Tip: At the bottom of the movement, focus on keeping a little bend in your arms to keep tension on the triceps muscle.
        Now slowly let your arms come back up to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dips - Triceps Version", "To get into the starting position, hold your body at arm's length with your arms nearly locked above the bars.
        Now, inhale and slowly lower yourself downward. Your torso should remain upright and your elbows should stay close to your body. This helps to better focus on tricep involvement. Lower yourself until there is a 90 degree angle formed between the upper arm and forearm.
        Then, exhale and push your torso back up using your triceps to bring your body back to the starting position.
        Repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Drag Curl", "rab a barbell with a supinated grip (palms facing forward) and get your elbows close to your torso and back. This will be your starting position.
        As you exhale, curl the bar up while keeping the elbows to the back as you ""Drag"" the bar up by keeping it in contact with your torso. Tip: As you can see, you will not be keeping the elbows pinned to your sides, but instead you will be bringing them back. Also, do not lift your shoulders.
        Slowly go back to the starting position as you keep the bar in contact with the torso at all times.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Floor Press", "Lay on the floor holding dumbbells in your hands. Your knees can be bent. Begin with the weights fully extended above you.
        Lower the weights until your upper arm comes in contact with the floor. You can tuck your elbows to emphasize triceps size and strength, or to focus on your chest angle your arms to the side.
        Pause at the bottom, and then bring the weight together at the top by extending through the elbows.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Lying Pronation", "Lie on a flat bench face down with one arm holding a dumbbell and the other hand on top of the bench folded so that you can rest your head on it.
        Bend the elbows of the arm holding the dumbbell so that it creates a 90-degree angle between the upper arm and the forearm.
        Now raise the upper arm so that the forearm is perpendicular to the floor and the upper arm is perpendicular to your torso. Tip: The upper arm should be parallel to the floor and also creating a 90-degree angle with your torso. This will be your starting position.
        As you breathe out, externally rotate your forearm so that the dumbbell is lifted forward as you maintain the 90 degree angle bend between the upper arms and the forearm. You will continue this external rotation until the forearm is parallel to the floor. At this point you will hold the contraction for a second.
        As you breathe in, slowly go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Lying Supination", "Lie sideways on a flat bench with one arm holding a dumbbell and the other hand on top of the bench folded so that you can rest your head on it.
        Bend the elbows of the arm holding the dumbbell so that it creates a 90-degree angle between the upper arm and the forearm.
        Now raise the upper arm so that the forearm is parallel to the floor and perpendicular to your torso (Tip: So the forearm will be directly in front of you). The upper arm will be stationary by your torso and should be parallel to the floor (aligned with your torso at all times). This will be your starting position.
        As you breathe out, externally rotate your forearm so that the dumbbell is lifted up in a semicircle motion as you maintain the 90 degree angle bend between the upper arms and the forearm. You will continue this external rotation until the forearm is perpendicular to the floor and the torso pointing towards the ceiling. At this point you will hold the contraction for a second.
        As you breathe in, slowly go back to the starting position.
        Repeat for the recommended amount of repetitions and then switch to the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell One-Arm Triceps Extension", "Grab a dumbbell and either sit on a military press bench or a utility bench that has a back support on it as you place the dumbbells upright on top of your thighs or stand up straight.
        Clean the dumbbell up to bring it to shoulder height and then extend the arm over your head so that the whole arm is perpendicular to the floor and next to your head. The dumbbell should be on top of you. The other hand can be kept fully extended to the side, by the waist, supporting the upper arm that has the dumbbell or grabbing a fixed surface.
        Rotate the wrist so that the palm of your hand is facing forward and the pinkie is facing the ceiling. This will be your starting position.
        Slowly lower the dumbbell behind your head as you hold the upper arm stationary. Inhale as you perform this movement and pause when your triceps are fully stretched.
        Return to the starting position by flexing your triceps as you breathe out. Tip: It is imperative that only the forearm moves. The upper arm should remain at all times stationary next to your head.
        Repeat for the recommended amount of repetitions and switch arms.");
        INSERT INTO Workout (title, `desc`) VALUES ("Finger Curls", "Hold a barbell with both hands and your palms facing up; hands spaced about shoulder width.
        Place your feet flat on the floor, at a distance that is slightly wider than shoulder width apart. This will be your starting position.
        Lower the bar as far as possible by extending the fingers. Allowing the bar to roll down the hands, catch the bar with the final joint in the fingers.
        Now curl bar up as high as possible by closing your hands while exhaling. Hold the contraction at the top.");
        INSERT INTO Workout (title, `desc`) VALUES ("Floor Press", "Adjust the j-hooks so they are at the appropriate height to rack the bar. Begin lying on the floor with your head near the end of a power rack. Keeping your shoulder blades pulled together; pull the bar off of the hooks.
        Lower the bar towards the bottom of your chest or upper stomach, squeezing the bar and attempting to pull it apart as you do so. Ensure that you tuck your elbows throughout the movement. Lower the bar until your upper arm contacts the ground and pause, preventing any slamming or bouncing of the weight.
        Press the bar back up as fast as you can, keeping the bar, your wrists, and elbows in line as you do so.");
        INSERT INTO Workout (title, `desc`) VALUES ("High Cable Curls", "Stand between a couple of high pulleys and grab a handle in each arm. Position your upper arms in a way that they are parallel to the floor with the palms of your hands facing you. This will be your starting position.
        Curl the handles towards you until they are next to your ears. Make sure that as you do so you flex your biceps and exhale. The upper arms should remain stationary and only the forearms should move. Hold for a second in the contracted position as you squeeze the biceps.
        Slowly bring back the arms to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("JM Press", "Start the exercise the same way you would a close grip bench press. You will lie on a flat bench while holding a barbell at arms length (fully extended) with the elbows in. However, instead of having the arms perpendicular to the torso, make sure the bar is set in a direct line above the upper chest. This will be your starting position.
        Now beginning from a fully extended position lower the bar down as if performing a lying triceps extension. Inhale as you perform this movement. When you reach the half way point, let the bar roll back about one inch by moving the upper arms towards your legs until they are perpendicular to the torso. Tip: Keep the bend at the elbows constant as you bring the upper arms forward.
        As you exhale, press the bar back up by using the triceps to perform a close grip bench press.
        Now go back to the starting position and start over.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Kneeling Cable Triceps Extension", "Place a bench sideways in front of a high pulley machine.
        Hold a straight bar attachment above your head with your hands about 6 inches apart with your palms facing down.
        Face away from the machine and kneel.
        Place your head and the back of your upper arms on the bench. Your elbows should be bent with the forearms pointing towards the high pulley. This will be your starting position.
        While keeping your upper arms close to your head at all times with the elbows in, press the bar out in a semicircular motion until the elbows are locked and your arms are parallel to the floor. Contract the triceps hard and keep this position for a second. Exhale as you perform this movement.
        Slowly return to the starting position as you breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Kneeling Forearm Stretch", "Start by kneeling on a mat with your palms flat and your fingers pointing back toward your knees.
        Slowly lean back keeping your palms flat on the floor until you feel a stretch in your wrists and forearms. Hold for 20-30 seconds.");
        INSERT INTO Workout (title, `desc`) VALUES ("Low Cable Triceps Extension", "Select the desired weight and lay down face up on the bench of a seated row machine that has a rope attached to it. Your head should be pointing towards the attachment.
        Grab the outside of the rope ends with your palms facing each other (neutral grip).
        Position your elbows so that they are bent at a 90 degree angle and your upper arms are perpendicular (90 degree angle) to your torso. Tip: Keep the elbows in and make sure that the upper arms point to the ceiling while your forearms point towards the pulley above your head. This will be your starting position.
        As you breathe out, extend your lower arms until they are straight and vertical. The upper arms and elbows remain stationary throughout the movement. Only the forearms should move. Contract the triceps hard for a second.
        As you breathe in slowly return to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Cable Curl", "Grab a straight bar or E-Z bar attachment that is attached to the low pulley with both hands, using an underhand (palms facing up) shoulder-width grip.
        Lie flat on your back on top of an exercise mat in front of the weight stack with your feet flat against the frame of the pulley machine and your legs straight.
        With your arms extended and your elbows close to your body slightly bend your arms. This will be your starting position.
        While keeping your upper arms stationary and the elbows close to your body, curl the bar up slowly toward your chest as you breathe out and you squeeze the biceps.
        After a second squeeze at the top of the movement, slowly return to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Dumbbell Tricep Extension", "Lie on a flat bench while holding two dumbbells directly in front of you. Your arms should be fully extended at a 90-degree angle from your torso and the floor. The palms should be facing in and the elbows should be tucked in. This is the starting position.
        As you breathe in and you keep the upper arms stationary with the elbows in, slowly lower the weight until the dumbbells are near your ears.
        At that point, while keeping the elbows in and the upper arms stationary, use the triceps to bring the weight back up to the starting position as you breathe out.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying High Bench Barbell Curl", "Lie face forward on a tall flat bench while holding a barbell with a supinated grip (palms facing up). Tip: If you are holding a barbell grab it using a shoulder-width grip and if you are using an E-Z Bar grab it on the inner handles. Your upper body should be positioned in a way that the upper chest is over the end of the bench and the barbell is hanging in front of you with the arms extended and perpendicular to the floor. This will be your starting position.
        While keeping the elbows in and the upper arms stationary, curl the weight up in a semi-circular motion as you contract the biceps and exhale. Hold at the top of the movement for a second.
        As you inhale, slowly go back to the starting position. Tip: Maintain full control of the weight at all times and avoid any swinging. Remember, only the forearms should move throughout the movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Supine Dumbbell Curl", "Lie down on a flat bench face up while holding a dumbbell in each arm on top of your thighs.
        Bring the dumbbells to the sides with the arms extended and the palms of the hands facing your thighs (neutral grip).
        While keeping the arms close to your torso and elbows in, slowly lower your arms (as you keep them extended with a slight bend at the elbows) as far down towards the floor as you can go. Once you cannot go down any further, lock your upper arms in that position and that will be your starting position.
        As you breathe out, slowly begin to curl the weights up as you simultaneously rotate your wrists so that the palms of the hands face up. Continue curling the weight until your biceps are fully contracted and squeeze hard at the top position for a second. Tip: Only the forearms should move. Upper arms should remain stationary and elbows should stay in throughout the movement.
        Return back to the starting position very slowly.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Bicep Curl", "Adjust the seat to the appropriate height and make your weight selection. Place your upper arms against the pads and grasp the handles. This will be your starting position.
        Perform the movement by flexing the elbow, pulling your lower arm towards your upper arm.
        Pause at the top of the movement, and then slowly return the weight to the starting position.
        Avoid returning the weight all the way to the stops until the set is complete to keep tension on the muscles being worked.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Preacher Curls", "Sit down on the Preacher Curl Machine and select the weight.
        Place the back of your upper arms (your triceps) on the preacher pad provided and grab the handles using an underhand grip (palms facing up). Tip: Make sure that when you place the arms on the pad you keep the elbows in. This will be your starting position.
        Now lift the handles as you exhale and you contract the biceps. At the top of the position make sure that you hold the contraction for a second. Tip: Only the forearms should move. The upper arms should remain stationary and on the pad at all times.
        Lower the handles slowly back to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("One Arm Dumbbell Preacher Curl", "Grab a dumbbell with the right arm and place the upper arm on top of the preacher bench or the incline bench. The dumbbell should be held at shoulder length. This will be your starting position.
        As you breathe in, slowly lower the dumbbell until your upper arm is extended and the biceps is fully stretched.
        As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the dumbbell is at shoulder height. Again, remember that to ensure full contraction you need to bring that small finger higher than the thumb.
        Squeeze the biceps hard for a second at the contracted position and repeat for the recommended amount of repetitions.
        Switch arms and repeat the movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("One Arm Floor Press", "Lie down on a flat surface with your back pressing against the floor or an exercise mat. Make sure your knees are bent.
        Have a partner hand you the bar on one hand. When starting, your arm should be just about fully extended, similar to the starting position of a barbell bench press. However, this time your grip will be neutral (palms facing your torso).
        Make sure the hand you are not using to lift the weight is placed by your side.
        Begin the exercise by lowering the barbell until your elbow touches the ground. Make sure to breathe in as this is the eccentric (lowering part of the exercise).
        Then start lifting the barbell back up to the original starting position. Remember to breathe out during the concentric (lifting part of the exercise).
        Repeat until you have performed your recommended repetitions.
        Switch arms and repeat the movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("One Arm Pronated Dumbbell Triceps Extension", "Lie flat on a bench while holding a dumbbell at arms length. Your arm should be perpendicular to your body. The palm of your hand should be facing towards your feet as a pronated grip is required to perform this exercise.
        Place your non lifting hand on your bicep for support.
        Slowly begin to lower the dumbbell down as you breathe in.
        Then, begin lifting the dumbbell upward as you contract the triceps. Remember to breathe out during the concentric (lifting part of the exercise).
        Repeat until you have performed your set repetitions.
        Switch arms and repeat the movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("One Arm Supinated Dumbbell Triceps Extension", "Lie flat on a bench while holding a dumbbell at arms length. Your arm should be perpendicular to your body. The palm of your hand should be facing towards your face as a supinated grip is required to perform this exercise.
        Place your non lifting hand on your bicep for support.
        Slowly begin to lower the dumbbell down as you breathe in.
        Then, begin lifting the dumbbell upward as you contract the triceps. Remember to breathe out during the concentric (lifting part of the exercise).
        Repeat until you have performed your set repetitions.
        Switch arms and repeat the movement.
        Switch arms again and repeat the movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("Overhead Cable Curl", "To begin, set a weight that is comfortable on each side of the pulley machine. Note: Make sure that the amount of weight selected is the same on each side.
        Now adjust the height of the pulleys on each side and make sure that they are positioned at a height higher than that of your shoulders.
        Stand in the middle of both sides and use an underhand grip (palms facing towards the ceiling) to grab each handle. Your arms should be fully extended and parallel to the floor with your feet positioned shoulder width apart from each other. Your body should be evenly aligned the handles. This is the starting position.
        While exhaling, slowly squeeze the biceps on each side until your forearms and biceps touch.
        While inhaling, move your forearms back to the starting position. Note: Your entire body is stationary during this exercise except for the forearms.
        Repeat for the recommended amount of repetitions prescribed in your program.");
        INSERT INTO Workout (title, `desc`) VALUES ("Overhead Triceps", "Sit upright on the floor with your partner behind you. Raise one arm straight up, and flex the elbow, attempting to touch your hand to your back. Your parner should hold your elbow and wrist. This will be your starting position.
        Attempt to extend the arm straight into the air as your partner prevents you from doing actually doing so.
        After 10-20 seconds, relax the arm and allow your partner to further stretch the tricep by applying gentle pressure to the wrist. Hold for 10-20 seconds, and then switch sides.");
        INSERT INTO Workout (title, `desc`) VALUES ("Palms-Down Wrist Curls Over a Bench", "Start out by placing two dumbbells on one side of a flat bench.
        Kneel down on both of your knees so that your body is facing the flat bench.
        Use your arms to grab both of the dumbbells with a pronated grip (palms facing down) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge.
        Start out by curling your wrist upwards and exhaling.
        Slowly lower your wrists back down to the starting position while inhaling.
        Your forearms should be stationary as your wrist is the only movement needed to perform this exercise.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Pin Presses", "Pin presses remove the eccentric phase of the bench press, developing starting strength. They also allow you to train a desired range of motion.
        The bench should be set up in a power rack. Set the pins to the desired point in your range of motion, whether it just be lockout or an inch off of your chest. The bar should be moved to the pins and prepared for lifting.
        Begin by lying on the bench, with the bar directly above the contact point during your regular bench. Tuck your feet underneath you and arch your back. Using the bar to help support your weight, lift your shoulder off the bench and retract them, squeezing the shoulder blades together. Use your feet to drive your traps into the bench. Maintain this tight body position throughout the movement.
        You can take a standard bench grip, or shoulder width to focus on the triceps. The bar, wrist, and elbow should stay in line at all times. Focus on squeezing the bar and trying to pull it apart.
        Drive the bar up with as much force as possible. The elbows should be tucked in until lockout.
        Return the bar to the pins, pausing before beginning the next repetition.");
        INSERT INTO Workout (title, `desc`) VALUES ("Preacher Curl", "To perform this movement you will need a preacher bench and an E-Z bar. Grab the E-Z curl bar at the close inner handle (either have someone hand you the bar which is preferable or grab the bar from the front bar rest provided by most preacher benches). The palm of your hands should be facing forward and they should be slightly tilted inwards due to the shape of the bar.
        With the upper arms positioned against the preacher bench pad and the chest against it, hold the E-Z Curl Bar at shoulder length. This will be your starting position.
        As you breathe in, slowly lower the bar until your upper arm is extended and the biceps is fully stretched.
        As you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the bar is at shoulder height. Squeeze the biceps hard and hold this position for a second.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push-ups - Close Triceps Position", "Lie on the floor face down and place your hands closer than shoulder width for a close hand position. Make sure that you are holding your torso up at arms' length.
        Lower yourself until your chest almost touches the floor as you inhale.
        Using your triceps and some of your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.
        After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Barbell Curl", "Stand up with your torso upright while holding a barbell at shoulder width with the elbows close to the torso. The palm of your hands should be facing down (pronated grip). This will be your starting position.
        While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.
        Slowly begin to bring the bar back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Cable Curl", "Stand up with your torso upright while holding a bar attachment that is attached to a low pulley using a pronated (palms down) and shoulder width grip. Make sure also that you keep the elbows close to the torso. This will be your starting position.
        While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.
        Slowly begin to bring the bar back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Grip Triceps Pushdown", "Start by setting a bar attachment (straight or e-z) on a high pulley machine.
        Facing the bar attachment, grab it with the palms facing up (supinated grip) at shoulder width. Lower the bar by using your lats until your arms are fully extended by your sides. Tip: Elbows should be in by your sides and your feet should be shoulder width apart from each other. This is the starting position.
        Slowly elevate the bar attachment up as you inhale so it is aligned with your chest. Only the forearms should move and the elbows/upper arms should be stationary by your side at all times.
        Then begin to lower the cable bar back down to the original staring position while exhaling and contracting the triceps hard.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Triceps Bench Press", "Lie back on a flat bench. Using a close, supinated grip (around shoulder width), lift the bar from the rack and hold it straight over you with your arms locked extended in front of you and perpendicular to the floor. This will be your starting position.
        As you breathe in, come down slowly until you feel the bar on your middle chest. Tip: Make sure that as opposed to a regular bench press, you keep the elbows close to the torso at all times in order to maximize triceps involvement.
        After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your triceps muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.
        Repeat the movement for the prescribed amount of repetitions.
        When you are done, place the bar back in the rack.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Bent-Over One-Arm Dumbbell Triceps Extension", "Sit down at the end of a flat bench with a dumbbell in one arm using a neutral grip (palms of the hand facing you).
        Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.
        The upper arm with the dumbbell should be close to the torso and aligned with it (lifted up until it is parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights). Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.
        Keeping the upper arm stationary, use the triceps to lift the weight as you exhale until the forearm is parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.
        After a second contraction at the top, slowly lower the dumbbell back to the starting position as you inhale.
        Repeat the movement for the prescribed amount of repetitions.
        Switch arms and repeat the exercise.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Bent-Over Two-Arm Dumbbell Triceps Extension", "Sit down at the end of a flat bench with a dumbbell in both arms using a neutral grip (palms of the hand facing you).
        Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.
        The upper arms with the dumbbells should be close to the torso and aligned with it (lifted up until they are parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights). Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.
        Keeping the upper arms stationary, use the triceps to lift the weight as you exhale until the forearms are parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.
        After a second contraction at the top, slowly lower the dumbbells back to the starting position as you inhale.
        Repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Biceps", "Sit on the floor with your knees bent and your partner standing behind you. Extend your arms straight behind you with your palms facing each other. Your partner will hold your wrists for you. This will be the starting position.
        Attempt to flex your elbows, while your partner prevents any actual movement.
        After 10-20 seconds, relax your arms while your partner gently pulls your wrists up to stretch your biceps. Be sure to let your partner know when the stretch is appropriate to prevent injury or overstretching.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Close-Grip Concentration Barbell Curl", "Sit down on a flat bench with a barbell or E-Z Bar in front of you in between your legs. Your legs should be spread with the knees bent and the feet on the floor.
        Use your arms to pick the barbell up and place the back of your upper arms on top of your inner thighs (around three and a half inches away from the front of the knee). A supinated grip closer than shoulder width is needed to perform this exercise. Tip: Your arm should be extended at arms length and the barbell should be above the floor. This will be your starting position.
        While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.
        Slowly begin to bring the barbell back to starting position as your breathe in. Tip: Avoid swinging motions at any time.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Dumbbell Curl", "Sit on a flat bench with a dumbbell on each hand being held at arms length. The elbows should be close to the torso.
        Rotate the palms of the hands so that they are facing your torso. This will be your starting position.
        While holding the upper arm stationary, curl the weights and start twisting the wrists once the dumbbells pass your thighs so that the palms of your hands face forward at the end of the movement. Make sure that you contract the biceps as you breathe out and make sure that only the forearms move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.
        Slowly begin to bring the dumbbells back to the starting position as your breathe in and as you rotate the wrists back to a neutral grip.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Dumbbell Inner Biceps Curl", "Sit on the end of a flat bench with a dumbbell in each hand being held at arms length. The elbows should be close to the torso.
        Rotate the palms of the hands so that they are facing inward in a neutral position. This will be your starting position.
        While holding the upper arms stationary, curl the dumbbells out and up, turning the palms out as you lift and keeping your forearms in line with your outer deltoids. Tips:
        Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps.
        Slowly begin to bring the dumbbells back to the starting position as your breathe in. Remember to rotate your arms as you lower the dumbbells so that you can switch back to a neutral grip.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Triceps Press", "Sit down on a bench with back support and grasp a dumbbell with both hands and hold it overhead at arm's length. Tip: a better way is to have somebody hand it to you especially if it is very heavy. The resistance should be resting in the palms of your hands with your thumbs around it. The palm of the hand should be facing inward. This will be your starting position.
        Keeping your upper arms close to your head (elbows in) and perpendicular to the floor, lower the resistance in a semi-circular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.
        Go back to the starting position by using the triceps to raise the dumbbell. Breathe out as you perform this step.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Close-Grip Bench Press", "Place a flat bench underneath the smith machine. Place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the flat bench. Using a close and pronated grip (palms facing forward) that is around shoulder width, unlock the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.
        As you breathe in, come down slowly until you feel the bar on your middle chest. Tip: Make sure that as opposed to a regular bench press, you keep the elbows close to the torso at all times in order to maximize triceps involvement.
        After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your triceps muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.
        Repeat the movement for the prescribed amount of repetitions.
        When you are done, lock the bar back in the rack.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Bent-Over One-Arm Dumbbell Triceps Extension", "With a dumbbell in one hand and the palm facing your torso, bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up.
        The upper arm should be close to the torso and parallel to the floor while the forearm is pointing towards the floor as the hand holds the weight. Tip: There should be a 90-degree angle between the forearm and the upper arm. This is your starting position.
        Keeping the upper arms stationary, use the triceps to lift the weights as you exhale until the forearms are parallel to the floor and the whole arm is extended. Like many other arm exercises, only the forearm moves.
        After a second contraction at the top, slowly lower the dumbbell back to the starting position as you inhale.
        Repeat the movement for the prescribed amount of repetitions.
        Switch arms and repeat the exercise.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Bent-Over Two-Arm Dumbbell Triceps Extension", "With a dumbbell in each hand and the palms facing your torso, bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Make sure that you keep the head up. The upper arms should be close to the torso and parallel to the floor while the forearms are pointing towards the floor as the hands hold the weights. Tip: There should be a 90-degree angle between the forearms and the upper arm. This is your starting position.
        Keeping the upper arms stationary, use the triceps to lift the weights as you exhale until the forearms are parallel to the floor and the whole arms are extended. Like many other arm exercises, only the forearm moves.
        After a second contraction at the top, slowly lower the dumbbells back to their starting position as you inhale.
        Repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Biceps Cable Curl", "Stand up with your torso upright while holding a cable curl bar that is attached to a low pulley. Grab the cable bar at shoulder width and keep the elbows close to the torso. The palm of your hands should be facing up (supinated grip). This will be your starting position.
        While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.
        Slowly begin to bring the curl bar back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Concentration Curl", "Taking a dumbbell in your working hand, lean forward. Allow your working arm to hang perpendicular to the ground with the elbow pointing out. This will be your starting position.
        Flex the elbow to curl the weight, keeping the upper arm stationary. At the top of the repetition, flex the biceps and pause.
        Lower the dumbbell back to the starting position.
        Repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Dumbbell Reverse Curl", "To begin, stand straight with a dumbbell in each hand using a pronated grip (palms facing down). Your arms should be fully extended while your feet are shoulder width apart from each other. This is the starting position.
        While holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the muscle.
        Slowly begin to bring the dumbbells back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Dumbbell Triceps Extension", "To begin, stand up with a dumbbell held by both hands. Your feet should be about shoulder width apart from each other. Slowly use both hands to grab the dumbbell and lift it over your head until both arms are fully extended.
        The resistance should be resting in the palms of your hands with your thumbs around it. The palm of the hands should be facing up towards the ceiling. This will be your starting position.
        Keeping your upper arms close to your head with elbows in and perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.
        Go back to the starting position by using the triceps to raise the dumbbell. Breathe out as you perform this step.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Inner-Biceps Curl", "Stand up with a dumbbell in each hand being held at arms length. The elbows should be close to the torso. Your legs should be at about shoulder's width apart from each other.
        Rotate the palms of the hands so that they are facing inward in a neutral position. This will be your starting position.
        While holding the upper arms stationary, curl the weights out while contracting the biceps as you breathe out. Your wrist should turn so that when the weights are fully elevated you have supinated grip (palms facing up).
        Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level. Tip: Keep the forearms aligned with your outer deltoids.
        Hold the contracted position for a second as you squeeze the biceps.
        Slowly begin to bring the dumbbells back to the starting position as your breathe in. Remember to rotate the wrists as you lower the weight in order to switch back to a neutral grip.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing One-Arm Cable Curl", "Start out by grabbing single handle next to the low pulley machine. Make sure you are far enough from the machine so that your arm is supporting the weight.
        Make sure that your upper arm is stationary, perpendicular to the floor with elbows in and palms facing forward. Your non lifting arm should be grabbing your waist. This will allow you to keep your balance.
        Slowly begin to curl the single handle upwards while keeping the upper arm stationary until your forearm touches your bicep while exhaling. Tip: Only the forearm should move.
        Hold the contraction position as you squeeze the bicep and then lower the single handle back down to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.
        Switch arms while performing this exercise.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing One-Arm Dumbbell Curl Over Incline Bench", "Stand on the back side of an incline bench as if you were going to be a spotter for someone. Have a dumbbell in one hand and rest it across the incline bench with a supinated (palms up) grip.
        Position your non lifting hand at the corner or side of the incline bench. The chest should be pressed against the top part of the incline and your feet should be pressed against the floor at a wide stance. This is the starting position.
        While holding the upper arm stationary, curl the dumbbell upward while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the dumbbell is at shoulder level. Hold the contracted position for a second.
        Slowly begin to bring the dumbbells back to starting position as your breathe in.
        Repeat for the recommended amount of repetitions.
        Switch arms while performing this exercise.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Overhead Barbell Triceps Extension", "To begin, stand up holding a barbell or e-z bar using a pronated grip (palms facing forward) with your hands closer than shoulder width apart from each other. Your feet should be about shoulder width apart.
        Now elevate the barbell above your head until your arms are fully extended. Keep your elbows in. This will be your starting position.
        Keeping your upper arms close to your head and elbows in, perpendicular to the floor, lower the resistance in a semicircular motion behind your head until your forearms touch your biceps. Tip: The upper arms should remain stationary and only the forearms should move. Breathe in as you perform this step.
        Go back to the starting position by using the triceps to raise the barbell. Breathe out as you perform this step.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Tate Press", "Lie down on a flat bench with a dumbbell in each hand on top of your thighs. The palms of your hand will be facing each other.
        By using your thighs to help you get the dumbbells up, clean the dumbbells one arm at a time so that you can hold them in front of you at shoulder width. Note: when holding the dumbbells in front of you, make sure your arms are wider than shoulder width apart from each other using a pronated (palms forward) grip. Allow your elbows to point out. This is your starting position.
        Keeping the upper arms stationary, slowly move the dumbbells in and down in a semi circular motion until they touch the upper chest while inhaling. Keep full control of the dumbbells at all times and do not move the upper arms nor rest the dumbbells on the chest.
        As you breathe out, move the dumbbells up using your triceps and the same semi-circular motion but in reverse. Attempt to keep the dumbbells together as they move up. Lock your arms in the contracted position, hold for a second and then start coming down again slowly again. Tip: It should take at least twice as long to go down than to come up.
        Repeat the movement for the prescribed amount of repetitions of your training program.");
        INSERT INTO Workout (title, `desc`) VALUES ("Tricep Dumbbell Kickback", "Start with a dumbbell in each hand and your palms facing your torso. Keep your back straight with a slight bend in the knees and bend forward at the waist. Your torso should be almost parallel to the floor. Make sure to keep your head up. Your upper arms should be close to your torso and parallel to the floor. Your forearms should be pointed towards the floor as you hold the weights. There should be a 90-degree angle formed between your forearm and upper arm. This is your starting position.
        Now, while keeping your upper arms stationary, exhale and use your triceps to lift the weights until the arm is fully extended. Focus on moving the forearm.
        After a brief pause at the top contraction, inhale and slowly lower the dumbbells back down to the starting position.
        Repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Tricep Plank Extension", "Assume a push-up position on the ground with a dumbbell in each hand. You should be supporting your body weight on your toes and hands keeping your torso straight. Your arms should be shoulder-width apart and fully extended. This will be your starting position.
        Initiate the movement by rowing a dumbbell to one side, pulling the upper arm parallel to your torso. Keep the arm fixed to your side, and then extend the elbow to perform a triceps extension.
        Reverse the movement and return the dumbbell to the ground adopting the start position once again. Alternate the movement between each side.");
        INSERT INTO Workout (title, `desc`) VALUES ("Triceps Pushdown", "Attach a straight or angled bar to a high pulley and grab with an overhand grip (palms facing down) at shoulder width.
        Standing upright with the torso straight and a very small inclination forward, bring the upper arms close to your body and perpendicular to the floor. The forearms should be pointing up towards the pulley as they hold the bar. This is your starting position.
        Using the triceps, bring the bar down until it touches the front of your thighs and the arms are fully extended perpendicular to the floor. The upper arms should always remain stationary next to your torso and only the forearms should move. Exhale as you perform this movement.
        After a second hold at the contracted position, bring the bar slowly up to the starting point. Breathe in as you perform this step.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Zottman Curl", "Stand up with your torso upright and a dumbbell in each hand being held at arms length. The elbows should be close to the torso.
        Make sure the palms of the hands are facing each other. This will be your starting position.
        While holding the upper arm stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Your wrist should rotate so that you have a supinated (palms up) grip. Continue the movement until your biceps are fully contracted and the dumbbells are at shoulder level.
        Hold the contracted position for a second as you squeeze the biceps.
        Now during the contracted position, rotate your wrist until you now have a pronated (palms facing down) grip with the thumb at a higher position than the pinky.
        Slowly begin to bring the dumbbells back down using the pronated grip.
        As the dumbbells close your thighs, start rotating the wrist so that you go back to a neutral (palms facing your body) grip.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Zottman Preacher Curl", "Grab a dumbbell in each hand and place your upper arms on top of the preacher bench or the incline bench. The dumbbells should be held at shoulder height and the elbows should be flexed. Hold the dumbbells with the palms of your hands facing down. This will be your starting position.
        As you breathe in, slowly lower the dumbbells keeping the palms down until your upper arm is extended and your biceps are fully stretched.
        Now rotate your wrists once you are at the bottom of the movement so that the palms of the hands are facing up.
        As you exhale, use your biceps to curl the weights up until they are fully contracted and the dumbbells are at shoulder height. Again, remember that to ensure full contraction you need to bring that small finger higher than the thumb.
        Squeeze the biceps hard for a second at the contracted position and rotate your wrists so that the palms are facing down again.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push-ups", "The starting position is facing down with weight distributed on the hands and feet. The body is rigid and straight, and the hands are usually placed approximately shoulder width apart (the plank position).
        Lower your body until your chest nears the floor at the bottom of the movement, and then return up to the starting position. This is one repetition
        Remember to move in a nice fluid motion, keeping the core muscle groups activated. Breathe out on the way down, and breathe in as you come back up.");
        INSERT INTO Workout (title, `desc`) VALUES ("Anti-Gravity Press", "Place a bar on the ground behind the head of an incline bench.
        Lay on the bench face down. With a pronated grip, pick the barbell up from the floor. Flex the elbows, performing a reverse curl to bring the bar near your chest. This will be your starting position.
        To begin, press the barbell out in front of your head by extending your elbows. Keep your arms parallel to the ground throughout the movement.
        Return to the starting position and repeat to complete the set.");
        INSERT INTO Workout (title, `desc`) VALUES ("Arnold Dumbbell Press", "Sit on an exercise bench with back support and hold two dumbbells in front of you at about upper chest level with your palms facing your body and your elbows bent. Tip: Your arms should be next to your torso. The starting position should look like the contracted portion of a dumbbell curl.
        Now to perform the movement, raise the dumbbells as you rotate the palms of your hands until they are facing forward.
        Continue lifting the dumbbells until your arms are extended above you in straight arm position. Breathe out as you perform this portion of the movement.
        After a second pause at the top, begin to lower the dumbbells to the original position by rotating the palms of your hands towards you. Tip: The left arm will be rotated in a counter clockwise manner while the right one will be rotated clockwise. Breathe in as you perform this portion of the movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Around the Worlds", "Lay down on a flat bench holding a dumbbell in each hand with the palms of the hands facing towards the ceiling. Tip: Your arms should be parallel to the floor and next to your thighs. To avoid injury, make sure that you keep your elbows slightly bent. This will be your starting position.
        Now move the dumbbells by creating a semi-circle as you displace them from the initial position to over the head. All of the movement should happen with the arms parallel to the floor at all times. Breathe in as you perform this portion of the movement.
        Reverse the movement to return the weight to the starting position as you exhale.");
        INSERT INTO Workout (title, `desc`) VALUES ("Axle Clean and Press", "Assume a shoulder-width stance, with knees inside the arms.
        While keeping the back flat, bend at the knees and hips so that you can grab the bar with the arms fully extended and a mixed grip that is slightly wider than shoulder width. The bar should be close to the shins with the shoulders over or slightly ahead of the bar. This will be your starting position.
        Extend the knees to raise the weight, keeping the angle of the back constant. Continue to lift the bar straight up, while keeping it close to your body.
        As the bar passes the knee, extend at the ankles, knees, and hips forcefully similar to a jumping motion. As you do so, continue to guide to bar with your hands, shrugging your shoulders and using the momentum from your movement to pull the bar as high as possible. The bar should travel close to your body, and you should keep your elbows out.
        At maximum elevation lean back and rest the bar on your torso. Switch your grip to a double overhand, and hitch the weight onto the front of the shoulders. Without moving your feet, press the bar overhead by extending the elbows.
        Return the bar to the floor under control.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Bench Press", "Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms), lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.
        From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest.
        After a brief pause, push the bar back to the starting position as you breathe out. Focus on pushing the bar using your chest muscles. Lock your arms and squeeze your chest in the contracted position at the top of the motion, hold for a second and then start coming down slowly again. Tip: Ideally, lowering the weight should take about twice as long as raising it.
        Repeat the movement for the prescribed amount of repetitions.
        When you are done, place the bar back in the rack.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Deadlift", "Approach the bar so that it is centered over your feet. Your feet should be about hip-width apart. Bend at the hip to grip the bar at shoulder-width allowing your shoulder blades to protract. Typically, you would use an alternating grip.
        With your feet and your grip set, take a big breath and then lower your hips and flex the knees until your shins contact the bar. Look forward with your head. Keep your chest up and your back arched, and begin driving through the heels to move the weight upward.
        After the bar passes the knees aggressively pull the bar back, pulling your shoulder blades together as you drive your hips forward into the bar.
        Lower the bar by bending at the hips and guiding it to the floor.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Front Raise", "Adopt a pronated, shoulder-width grip on the barbell from a standing position.
        Allow your arms to hang straight down to mid thigh with the elbows extended. Your head should face forward, with your shoulders back and your chest up. Maintain a neutral spine and contract your abs to provide core support. This will be your starting position.
        Initiate the movement by flexing the shoulder, raising the weight straight out in front of you. Keep the elbows extended and the wrist neutral throughout the movement. Continue the upward movement of the arms until the barbell is just above shoulder height.
        At the top of the motion, pause briefly, and then slowly return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Full Squat", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack just above shoulder level. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.
        Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and position your legs using a shoulder-width medium stance with the toes slightly pointed out. Keep your head up at all times and maintain a straight back. This will be your starting position.
        Begin to slowly lower the bar by bending the knees and sitting back with your hips as you maintain a straight posture with the head up. Continue down until your hamstrings are on your calves. Inhale as you perform this portion of the movement.
        Begin to raise the bar as you exhale by pushing the floor with the heel or middle of your foot as you straighten the legs and extend the hips to go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Glute Bridge", "Begin seated on the ground with a loaded barbell over your legs. Using a fat bar or having a pad on the bar can greatly reduce the discomfort caused by this exercise. Roll the bar so that it is directly above your hips, and lay down flat on the floor.
        Begin the movement by driving through with your heels, extending your hips vertically through the bar. Your weight should be supported by your upper back and the heels of your feet.
        Extend as far as possible, then reverse the motion to return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Hip Thrust", "Begin seated on the ground with a bench directly behind you. Have a loaded barbell over your legs. Using a fat bar or having a pad on the bar can greatly reduce the discomfort caused by this exercise.
        Roll the bar so that it is directly above your hips, and lean back against the bench so that your shoulder blades are near the top of it.
        Begin the movement by driving through your feet, extending your hips vertically through the bar. Your weight should be supported by your shoulder blades and your feet. Extend as far as possible, then reverse the motion to return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Lunge", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack just below shoulder level. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.
        Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and step forward with your right leg and squat down through your hips, while keeping the torso upright and maintaining balance. Inhale as you go down. Note: Do not allow your knee to go forward beyond your toes as you come down, as this will put undue stress on the knee joint. li>
        Using mainly the heel of your foot, push up and go back to the starting position as you exhale.
        Repeat the movement for the recommended amount of repetitions and then perform with the left leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Rear Delt Row", "Stand up straight while holding a barbell using a wide (higher than shoulder width) and overhand (palms facing your body) grip.
        Bend knees slightly and bend over as you keep the natural arch of your back. Let the arms hang in front of you as they hold the bar. Once your torso is parallel to the floor, flare the elbows out and away from your body. Tip: Your torso and your arms should resemble the letter ""T"". Now you are ready to begin the exercise.
        While keeping the upper arms perpendicular to the torso, pull the barbell up towards your upper chest as you squeeze the rear delts and you breathe out. Tip: When performed correctly, this exercise should resemble a bench press in reverse. Also, refrain from using your biceps to do the work. Focus on targeting the rear delts; the arms should only act as hooks.
        Slowly go back to the initial position as you breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Reverse Lunge", "Position a weighted bar across your upper back holding the ends with your hands to keep it stable. Alternately, you can do this in a squat rack to more easily get into the starting position. Stand erect with your chest out and your shoulders back, maintaining the natural curve in your back and knees unlocked. Your feet should be about hip width apart. This is your starting position.
        Staying erect, initiate the movement by stepping back with one foot about 2 feet, keeping your hips facing forward as the toe of your back foot makes contact first. Then allow both knees to bend and descend just short of allowing your trailing knee to touch the floor.
        Your body should continue to be upright. Don't lean forward or allow you back to round. Press back up by pushing through your back foot maintaining balance as you return to the starting position.
        Repeat on the opposite side, and repeat for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Seated Calf Raise", "Place a block about 12 inches in front of a flat bench.
        Sit on the bench and place the ball of your feet on the block.
        Have someone place a barbell over your upper thighs about 3 inches above your knees and hold it there. This will be your starting position.
        Raise up on your toes as high as possible as you squeeze the calves and as you breathe out.
        After a second contraction, slowly go back to the starting position. Tip: To get maximum benefit stretch your calves as far as you can.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Shoulder Press", "Sit on a bench with back support in a squat rack. Position a barbell at a height that is just above your head. Grab the barbell with a pronated grip (palms facing forward).
        Once you pick up the barbell with the correct grip width, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.
        Lower the bar down to the shoulders slowly as you inhale.
        Lift the bar back up to the starting position as you exhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Shrug", "Stand up straight with your feet at shoulder width as you hold a barbell with both hands in front of you using a pronated grip (palms facing the thighs). Tip: Your hands should be a little wider than shoulder width apart. You can use wrist wraps for this exercise for a better grip. This will be your starting position.
        Raise your shoulders up as far as you can go as you breathe out and hold the contraction for a second. Tip: Refrain from trying to lift the barbell by using your biceps.
        Slowly return to the starting position as you breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Shrug Behind the Back", "Stand up straight with your feet at shoulder width as you hold a barbell with both hands behind your back using a pronated grip (palms facing back). Tip: Your hands should be a little wider than shoulder width apart. You can use wrist wraps for this exercise for better grip. This will be your starting position.
        Raise your shoulders up as far as you can go as you breathe out and hold the contraction for a second. Tip: Refrain from trying to lift the barbell by using your biceps. The arms should remain stretched out at all times.
        Slowly return to the starting position as you breathe in.
        Repeat for the recommended amount of repetitions.
        ");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Side Split Squat", "Stand up straight while holding a barbell placed on the back of your shoulders (slightly below the neck). Your feet should be placed wide apart with the foot of the lead leg angled out to the side. This will be your starting position.
        Lower your body towards the side of your angled foot by bending the knee and hip of your lead leg and while keeping the opposite leg only slightly bent. Breathe in as you lower your body.
        Return to the starting position by extending the hip and knee of the lead leg. Breathe out as you perform this movement.
        After performing the recommended amount of reps, repeat the movement with the opposite leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Squat", "Begin with the barbell supported on top of the traps. The chest should be up and the head facing forward. Adopt a hip-width stance with the feet turned out as needed.
        descend by flexing the knees, refraining from moving the hips back as much as possible. This requires that the knees travel forward. Ensure that they stay align with the feet. The goal is to keep the torso as upright as possible.
        Continue all the way down, keeping the weight on the front of the heel. At the moment the upper legs contact the lower legs reverse the motion, driving the weight upward.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Step Ups", "Stand up straight while holding a barbell placed on the back of your shoulders (slightly below the neck) and stand upright behind an elevated platform (such as the one used for spotting behind a flat bench). This is your starting position.
        Place the right foot on the elevated platform. Step on the platform by extending the hip and the knee of your right leg. Use the heel mainly to lift the rest of your body up and place the foot of the left leg on the platform as well. Breathe out as you execute the force required to come up.
        Step down with the left leg by flexing the hip and knee of the right leg as you inhale. Return to the original standing position by placing the right foot of to next to the left foot on the initial position.
        Repeat with the right leg for the recommended amount of repetitions and then perform with the left leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Thruster", "Set the bar in a rack slightly below shoulder level so that when under it, your knees are slightly bent. Rest the bar on top of the front deltoids, pushing into the clavicles, and lightly touching the throat. Your hands should be in a clean grip, touching the bar only with your fingers to help keep it in position.
        To unrack the bar, push upward into it and push your hips forward. Step away from the rack and position your legs using a shoulder-width medium stance with the toes slightly pointed out. Keep your head and elbows up at all times. Your triceps should remain parallel with the ground. Keep a neutral neck and flat back. This will be your starting position.
        descend into a squat by pushing your hips and butt back. Continue down until the upper legs are at or just below parallel to the floor. Inhale as you perform this portion of the movement.
        As you prepare to ascend, push through your heels and begin to wrap your fingers tightly around the bar for a firm grip. As you near the top of your squat, begin pressing the bar up towards the ceiling, allowing your neck to hyperextend so that the bar has room to move.
        A final position will be one in which your arms are fully extended overhead and your legs straight. Maintain tightness from head to toe.
        Lower the bar slowly, allowing your knees to bend to lessen the blow. Immediately transition back into the squatting movement to continue into the next repetition. Repeat for recommended number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Barbell Walking Lunge", "Begin standing with your feet shoulder width apart and a barbell across your upper back.
        Step forward with one leg, flexing the knees to drop your hips. descend until your rear knee nearly touches the ground. Your posture should remain upright, and your front knee should stay above the front foot.
        Drive through the heel of your lead foot and extend both knees to raise yourself back up.
        Step forward with your rear foot, repeating the lunge on the opposite leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bench Jump", "Begin with a box or bench 1-2 feet in front of you. Stand with your feet shoulder width apart. This will be your starting position.
        Perform a short squat in preparation for the jump; swing your arms behind you.
        Rebound out of this position, extending through the hips, knees, and ankles to jump as high as possible. Swing your arms forward and up.
        Jump over the bench, landing with the knees bent, absorbing the impact through the legs.
        Turn around and face the opposite direction, then jump back over the bench.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bent Over Barbell Row", "Holding a barbell with a pronated grip (palms facing down), bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The barbell should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position.
        Now, while keeping the torso stationary, breathe out and lift the barbell to you. Keep the elbows close to the body and only use the forearms to hold the weight. At the top contracted position, squeeze the back muscles and hold for a brief pause.
        Then inhale and slowly lower the barbell back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bent Over Two-Dumbbell Row", "With a dumbbell in each hand (palms facing your torso), bend your knees slightly and bring your torso forward by bending at the waist; as you bend make sure to keep your back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The weights should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position.
        While keeping the torso stationary, lift the dumbbells to your side (as you breathe out), keeping the elbows close to the body (do not exert any force with the forearm other than holding the weights). On the top contracted position, squeeze the back muscles and hold for a second.
        Slowly lower the weight again to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bent-Arm Barbell Pullover", "Lie on a flat bench with a barbell using a shoulder grip width.
        Hold the bar straight over your chest with a bend in your arms. This will be your starting position.
        While keeping your arms in the bent arm position, lower the weight slowly in an arc behind your head while breathing in until you feel a stretch on the chest.
        At that point, bring the barbell back to the starting position using the arc through which the weight was lowered and exhale as you perform this movement.
        Hold the weight on the initial position for a second and repeat the motion for the prescribed number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bent-Arm Dumbbell Pullover", "Place a dumbbell standing up on a flat bench.
        Ensuring that the dumbbell stays securely placed at the top of the bench, lie perpendicular to the bench (torso across it as in forming a cross) with only your shoulders lying on the surface. Hips should be below the bench and legs bent with feet firmly on the floor. The head will be off the bench as well.
        Grasp the dumbbell with both hands and hold it straight over your chest with a bend in your arms. Both palms should be pressing against the underside one of the sides of the dumbbell. This will be your starting position. Caution: Always ensure that the dumbbell used for this exercise is secure. Using a dumbbell with loose plates can result in the dumbbell falling apart and falling on your face.
        While keeping your arms locked in the bent arm position, lower the weight slowly in an arc behind your head while breathing in until you feel a stretch on the chest.
        At that point, bring the dumbbell back to the starting position using the arc through which the weight was lowered and exhale as you perform this movement.
        Hold the weight on the initial position for a second and repeat the motion for the prescribed number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bicycling, Stationary", "To begin, seat yourself on the bike and adjust the seat to your height.
        Select the desired option from the menu. You may have to start pedaling to turn it on. You can use the manual setting, or you can select a program to use. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. The level of resistance can be changed throughout the workout. The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bodyweight Lunge", "Stand erect with your feet hip-width apart, chest out, and shoulders back, maintaining the natural curvature of your spine. Your knees should be unlocked and your hand on your hips. This is your starting position.
        Take a moderate-length step forward with one foot, descending to a point in which your rear knee approaches the floor without touching, maintaining your body's upright posture. Your front knee should bend about 90 degrees, but for knee health it should not be forward of the vertical plane that extends straight up from your toes. If so, take a slightly longer step.
        From the bottom position, push back up from your forward foot, bringing it back beside the other.
        Repeat on the opposite side for the required number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bodyweight Reverse Lunge", "Begin in a standing position. Your hands should be on your hips or hanging at your sides. Look directly forward, keeping your chest up, with your feet shoulder-width apart. This will be your starting position.
        Initiate the movement by taking a step to the rear, allowing your hips and knees to flex to lower your body. Contacting the back leg through only the ball of the foot, descend until your knee nearly touches the ground. Use a slow and controlled motion, paying special attention to proper mechanics and posture. The knee should stay in line with the foot, and the thoracic spine should remain neutral.
        After a brief pause, return to the starting position by driving through the heel of the front leg to extend the knees and hips.
        This movement can be done completely on one side before switching, or can be performed in an alternating fashion.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bodyweight Squat", "Stand with your feet shoulder width apart. You can place your hands behind your head. This will be your starting position.
        Begin the movement by flexing your knees and hips, sitting back with your hips.
        Continue down to full depth if you are able,and quickly reverse the motion until you return to the starting position. As you squat, keep your head and chest up and push your knees out.");
        INSERT INTO Workout (title, `desc`) VALUES ("Bodyweight Walking Lunge", "Begin standing with your feet shoulder width apart and your hands on your hips.
        Step forward with one leg, flexing the knees to drop your hips. descend until your rear knee nearly touches the ground. Your posture should remain upright, and your front knee should stay above the front foot.
        Drive through the heel of your lead foot and extend both knees to raise yourself back up.
        Step forward with your rear foot, repeating the lunge on the opposite leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Box Squat", "The box squat allows you to squat to desired depth and develop explosive strength in the squat movement. Begin in a power rack with a box at the appropriate height behind you. Typically, you would aim for a box height that brings you to a parallel squat, but you can train higher or lower if desired.
        Begin by stepping under the bar and placing it across the back of the shoulders. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders. Remove the bar from the rack, creating a tight arch in your lower back, and step back into position. Place your feet wider for more emphasis on the back, glutes, adductors, and hamstrings, or closer together for more quad development. Keep your head facing forward.
        With your back, shoulders, and core tight, push your knees and butt out and you begin your `desc`ent. Sit back with your hips until you are seated on the box. Ideally, your shins should be perpendicular to the ground. Pause when you reach the box, and relax the hip flexors. Never bounce off of a box.
        Keeping the weight on your heels and pushing your feet and knees out, drive upward off of the box as you lead the movement with your head. Continue upward, maintaining tightness head to toe.");
        INSERT INTO Workout (title, `desc`) VALUES ("Burpee", "Begin standing with your legs shoulder-width apart.
        Place your hands on the floor and kick your legs back so you end up with your stomach and thighs on the floor. Your elbows should be bent.
        From this position, press up like you're doing a push-up and push your hips up.
        Jump your feet under your hips and stand.
        Finish the movement by jumping in the air and bringing your hands over your head.
        Repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Butt Kicks", "Stand with your legs shoulder-width apart. Your arms should be bent at your sides.
        Flex the right knee and kick your right heel up toward your glutes. Bring the right foot back down.
        As the right leg comes down, flex your left knee and kick your left foot up toward your glutes. Swing your arms as if you were jogging.
        Repeat");
        INSERT INTO Workout (title, `desc`) VALUES ("Butt Lift (Bridge)", "Lie flat on the floor on your back with the hands by your side and your knees bent. Your feet should be placed around shoulder width. This will be your starting position.
        Pushing mainly with your heels, lift your hips off the floor while keeping your back straight. Breathe out as you perform this part of the motion and hold at the top for a second.
        Slowly go back to the starting position as you breathe in.");
        INSERT INTO Workout (title, `desc`) VALUES ("Butterfly", "Sit on the machine with your back flat on the pad.
        Take hold of the handles. Tip: Your upper arms should be positioned parallel to the floor; adjust the machine accordingly. This will be your starting position.
        Push the handles together slowly as you squeeze your chest in the middle. Breathe out during this part of the motion and hold the contraction for a second.
        Return back to the starting position slowly as you inhale until your chest muscles are fully stretched.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Chest Press", "Adjust the weight to an appropriate amount and be seated, grasping the handles. Your upper arms should be about 45 degrees to the body, with your head and chest up. The elbows should be bent to about 90 degrees. This will be your starting position.
        Begin by extending through the elbow, pressing the handles together straight in front of you. Keep your shoulder blades retracted as you execute the movement.
        After pausing at full extension, return to th starting position, keeping tension on the cables.
        You can also execute this movement with your back off the pad, at an incline or decline, or alternate hands.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Crossover", "To get yourself into the starting position, place the pulleys on a high position (above your head), select the resistance to be used and hold the pulleys in each hand.
        Step forward in front of an imaginary straight line between both pulleys while pulling your arms together in front of you. Your torso should have a small forward bend from the waist. This will be your starting position.
        With a slight bend on your elbows in order to prevent stress at the biceps tendon, extend your arms to the side (straight out at both sides) in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, the arms and torso should remain stationary; the movement should only occur at the shoulder joint.
        Return your arms back to the starting position as you breathe out. Make sure to use the same arc of motion used to lower the weights.
        Hold for a second at the starting position and repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Deadlifts", "Move the cables to the bottom of the towers and select an appropriate weight. Stand directly in between the uprights.
        To begin, squat down be flexing your hips and knees until you can reach the handles.
        After grasping them, begin your ascent. Driving through your heels extend your hips and knees keeping your hands hanging at your side. Keep your head and chest up throughout the movement.
        After reaching a full standing position, Return to the starting position and repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Hip Adduction", "Stand in front of a low pulley facing forward with one leg next to the pulley and the other one away.
        Attach the ankle cuff to the cable and also to the ankle of the leg that is next to the pulley.
        Now step out and away from the stack with a wide stance and grasp the bar of the pulley system.
        Stand on the foot that does not have the ankle cuff (the far foot) and allow the leg with the cuff to be pulled towards the low pulley. This will be your starting position.
        Now perform the movement by moving the leg with the ankle cuff in front of the far leg by using the inner thighs to abduct the hip. Breathe out during this portion of the movement.
        Slowly return to the starting position as you breathe in.
        Repeat for the recommended amount of repetitions and then repeat the same movement with the opposite leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Internal Rotation", "Sit next to a low pulley sideways (with legs stretched in front of you or crossed) and grasp the single hand cable attachment with the arm nearest to the cable. Tip: If you can adjust the pulley’s height, you can use a flat bench to sit on instead.
        Position the elbow against your side with the elbow bent at 90° and the arm pointing towards the pulley. This will be your starting position.
        Pull the single hand cable attachment toward your body by internally rotating your shoulder until your forearm is across your abs. You will be creating an imaginary semi-circle. Tip: The forearm should be perpendicular to your torso at all times.
        Slowly go back to the initial position.
        Repeat for the recommended amount of repetitions and then repeat the movement with the next arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Iron Cross", "Begin by moving the pulleys to the high position, select the resistance to be used, and take a handle in each hand.
        Stand directly between both pulleys with your arms extended out to your sides. Your head and chest should be up while your arms form a “T”. This will be your starting position.
        Keeping the elbows extended, pull your arms straight to your sides.
        Return your arms back to the starting position after a pause at the peak contraction.
        Continue the movement for the prescribed number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Rear Delt Fly", "Adjust the pulleys to the appropriate height and adjust the weight. The pulleys should be above your head.
        Grab the left pulley with your right hand and the right pulley with your left hand, crossing them in front of you. This will be your starting position.
        Initiate the movement by moving your arms back and outward, keeping your arms straight as you execute the movement.
        Pause at the end of the motion before returning the handles to the start position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Seated Lateral Raise", "Stand in the middle of two low pulleys that are opposite to each other and place a flat bench right behind you (in perpendicular fashion to you; the narrow edge of the bench should be the one behind you). Select the weight to be used on each pulley.
        Now sit at the edge of the flat bench behind you with your feet placed in front of your knees.
        Bend forward while keeping your back flat and rest your torso on the thighs.
        Have someone give you the single handles attached to the pulleys. Grasp the left pulley with the right hand and the right pulley with the left after you select your weight. The pulleys should run under your knees and your arms will be extended with palms facing each other and a slight bend at the elbows. This will be the starting position.
        While keeping the arms stationary, raise the upper arms to the sides until they are parallel to the floor and at shoulder height. Exhale during the execution of this movement and hold the contraction for a second.
        Slowly lower your arms to the starting position as you inhale.
        Repeat for the recommended amount of repetitions. Tip: Maintain upper arms perpendicular to torso and a fixed elbow position (10 degree to 30 degree angle) throughout exercise.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Shoulder Press", "Move the cables to the bottom of the towers and select an appropriate weight.
        Stand directly in between the uprights. Grasp the cables and hold them at shoulder height, palms facing forward. This will be your starting position.
        Keeping your head and chest up, extend through the elbow to press the handles directly over head.
        After pausing at the top, return to the starting position and repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cable Shrugs", "Grasp a cable bar attachment that is attached to a low pulley with a shoulder width or slightly wider overhand (palms facing down) grip.
        Stand erect close to the pulley with your arms extended in front of you holding the bar. This will be your starting position.
        Lift the bar by elevating the shoulders as high as possible as you exhale. Hold the contraction at the top for a second. Tip: The arms should remain extended at all times. Refrain from using the biceps to help lift the bar. Only the shoulders should be moving up and down.
        Lower the bar back to the original position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Calf Press", "Adjust the seat so that your legs are only slightly bent in the start position. The balls of your feet should be firmly on the platform.
        Select an appropriate weight, and grasp the handles. This will be your starting position.
        Straighten the legs by extending the knees, just barely lifting the weight from the stack. Your ankle should be fully flexed, toes pointing up. Execute the movement by pressing downward through the balls of your feet as far as possible.
        After a brief pause, reverse the motion and repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Car Drivers", "While standing upright, hold a barbell plate in both hands at the 3 and 9 o'clock positions. Your palms should be facing each other and your arms should be extended straight out in front of you. This will be your starting position.
        Initiate the movement by rotating the plate as far to one side as possible. Use the same type of movement you would use to turn a steering wheel to one side.
        Reverse the motion, turning it all the way to the opposite side.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Chin-Up", "Grab the pull-up bar with the palms facing your torso and a grip closer than the shoulder width.
        As you have both arms extended in front of you holding the bar at the chosen grip width, keep your torso as straight as possible while creating a curvature on your lower back and sticking your chest out. This is your starting position. Tip: Keeping the torso as straight as possible maximizes biceps stimulation while minimizing back involvement.
        As you breathe out, pull your torso up until your head is around the level of the pull-up bar. Concentrate on using the biceps muscles in order to perform the movement. Keep the elbows close to your body. Tip: The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.
        After a second of squeezing the biceps in the contracted position, slowly lower your torso back to the starting position; when your arms are fully extended. Breathe in as you perform this portion of the movement.
        Repeat this motion for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Clean", "With a barbell on the floor close to the shins, take an overhand (or hook) grip just outside the legs. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.
        Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight. Move the weight with control as you continue to above the knees.
        Next comes the second pull, the main source of acceleration for the clean. As the bar approaches the mid-thigh position, begin extending through the hips. In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward. There should be no need to actively pull through the arms to accelerate the weight; at the end of the second pull, the body should be fully extended, leaning slightly back, with the arms still extended.
        As full extension is achieved, transition into the third pull by aggressively shrugging and flexing the arms with the elbows up and out. At peak extension, aggressively pull yourself down, rotating your elbows under the bar as you do so. Receive the bar in a front squat position, the depth of which is dependent upon the height of the bar at the end of the third pull. The bar should be racked onto the protracted shoulders, lightly touching the throat with the hands relaxed. Continue to descend to the bottom squat position, which will help in the recovery.
        Immediately recover by driving through the heels, keeping the torso upright and elbows up. Continue until you have risen to a standing position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Clean and Jerk", "With a barbell on the floor close to the shins, take an overhand or hook grip just outside the legs. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.
        Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight. Move the weight with control as you continue to above the knees.
        Next comes the second pull, the main source of acceleration for the clean. As the bar approaches the mid-thigh position, begin extending through the hips. In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward. There should be no need to actively pull through the arms to accelerate the weight; at the end of the second pull, the body should be fully extended, leaning slightly back, with the arms still extended.
        As full extension is achieved, transition into the third pull by aggressively shrugging and flexing the arms with the elbows up and out. At peak extension, aggressively pull yourself down, rotating your elbows under the bar as you do so. Receive the bar in a front squat position, the depth of which is dependent upon the height of the bar at the end of the third pull. The bar should be racked onto the protracted shoulders, lightly touching the throat with the hands relaxed. Continue to descend to the bottom squat position, which will help in the recovery.
        Immediately recover by driving through the heels, keeping the torso upright and elbows up. Continue until you have risen to a standing position.
        The second phase is the jerk, which raises the weight overhead. Standing with the weight racked on the front of the shoulders, begin with the dip. With your feet directly under your hips, flex the knees without moving the hips backward. Go down only slightly, and reverse direction as powerfully as possible.
        Drive through the heels create as much speed and force as possible, and be sure to move your head out of the way as the bar leaves the shoulders.
        At this moment as the feet leave the floor, the feet must be placed into the receiving position as quickly as possible. In the brief moment the feet are not actively driving against the platform, the athletes effort to push the bar up will drive them down. The feet should be split, with one foot forward, and one foot back. Receive the bar with the arms locked out overhead. Return to a standing position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Clean and Press", "Assume a shoulder-width stance, with knees inside the arms. Now while keeping the back flat, bend at the knees and hips so that you can grab the bar with the arms fully extended and a pronated grip that is slightly wider than shoulder width. Point the elbows out to sides. The bar should be close to the shins. Position the shoulders over or slightly ahead of the bar. Establish a flat back posture. This will be your starting position.
        Begin to pull the bar by extending the knees. Move your hips forward and raise the shoulders at the same rate while keeping the angle of the back constant; continue to lift the bar straight up while keeping it close to your body.
        As the bar passes the knee, extend at the ankles, knees, and hips forcefully, similar to a jumping motion. As you do so, continue to guide the bar with your hands, shrugging your shoulders and using the momentum from your movement to pull the bar as high as possible. The bar should travel close to your body, and you should keep your elbows out.
        At maximum elevation, your feet should clear the floor and you should start to pull yourself under the bar. The mechanics of this could change slightly, depending on the weight used. You should descend into a squatting position as you pull yourself under the bar.
        As the bar hits terminal height, rotate your elbows around and under the bar. Rack the bar across the front of the shoulders while keeping the torso erect and flexing the hips and knees to absorb the weight of the bar.
        Stand to full height, holding the bar in the clean position.
        Without moving your feet, press the bar overhead as you exhale. Lower the bar under control .");
        INSERT INTO Workout (title, `desc`) VALUES ("Clean Pull", "With a barbell on the floor close to the shins, take an overhand or hook grip just outside the legs. Lower your hips with the weight focused on the heels, back straight, head facing forward, chest up, with your shoulders just in front of the bar. This will be your starting position.
        Begin the first pull by driving through the heels, extending your knees. Your back angle should stay the same, and your arms should remain straight and elbows out. Move the weight with control as you continue to above the knees.
        Next comes the second pull, the main source of acceleration for the clean. As the bar approaches the mid-thigh position, begin extending through the hips. In a jumping motion, accelerate by extending the hips, knees, and ankles, using speed to move the bar upward. There should be no need to actively pull through the arms to accelerate the weight; at the end of the second pull, the body should be fully extended, leaning slightly back, with the arms still extended. Full extension should be violent and abrupt, and ensure that you do not prolong the extension for longer than necessary.");
        INSERT INTO Workout (title, `desc`) VALUES ("Clean Shrug", "Begin with a shoulder width, double overhand or hook grip, with the bar hanging at the mid thigh position. Your back should be straight and inclined slightly forward.
        Shrug your shoulders towards your ears. While this exercise can usually by loaded with heavier weight than a clean, avoid overloading to the point that the execution slows down.");
        INSERT INTO Workout (title, `desc`) VALUES ("Clock Push-Up", "Move into a prone position on the floor, supporting your weight on your hands and toes.
        Your arms should be fully extended with the hands around shoulder width. Keep your body straight throughout the movement. This will be your starting position.
        descend by flexing at the elbow, lowering your chest toward the ground.
        At the bottom, reverse the motion by pushing yourself up through elbow extension as quickly as possible until you are air borne. Aim to “jump” 12-18 inches to one side.
        As you accelerate up, move your outside foot away from your direction of travel. Leaving the ground, shift your body about 30 degrees for the next repetition.
        Return to the starting position and repeat the exercise, working all the way around until you are back where you started.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Lat Pulldown", "Sit down on a pull-down machine with a wide bar attached to the top pulley. Make sure that you adjust the knee pad of the machine to fit your height. These pads will prevent your body from being raised by the resistance attached to the bar.
        Grab the bar with the palms facing forward using the prescribed grip. Note on grips: For a wide grip, your hands need to be spaced out at a distance wider than your shoulder width. For a medium grip, your hands need to be spaced out at a distance equal to your shoulder width and for a close grip at a distance smaller than your shoulder width.
        As you have both arms extended in front of you - while holding the bar at the chosen grip width - bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.
        As you breathe out, bring the bar down until it touches your upper chest by drawing the shoulders and the upper arms down and back. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary (only the arms should move). The forearms should do no other work except for holding the bar; therefore do not try to pull the bar down using the forearms.
        After a second in the contracted position, while squeezing your shoulder blades together, slowly raise the bar back to the starting position when your arms are fully extended and the lats are fully stretched. Inhale during this portion of the movement.
        Repeat this motion for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Close-Hands Push-Up", "Get in the push-up position on your toes with your hands directly under your shoulders. Your body should be as straight as possible, maintaining the neutral alignment of your head. This is your start position.
        Allow your elbows to break as you lower your body toward the floor but don’t allow it to touch. Keep your body as straight as possible. Your elbows should be pointing rearward, bent about 90 degrees, at the bottom position.
        Press back up through your hands to full arm extension.
        Repeat for the required number of reps.");
        INSERT INTO Workout (title, `desc`) VALUES ("Crossover Reverse Lunge", "Stand with your feet shoulder width apart. This will be your starting position.
        Perform a rear lunge by stepping back with one foot and flexing the hips and front knee. As you do so, rotate your torso across the front leg.
        After a brief pause, return to the starting position and repeat on the other side, continuing in an alternating fashion.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cuban Press", "Take a dumbbell in each hand with a pronated grip in a standing position. Raise your upper arms so that they are parallel to the floor, allowing your lower arms to hang in the ""scarecrow"" position. This will be your starting position.
        To initiate the movement, externally rotate the shoulders to move the upper arm 180 degrees. Keep the upper arms in place, rotating the upper arms until the wrists are directly above the elbows, the forearms perpendicular to the floor.
        Now press the dumbbells by extending at the elbows, straightening your arms overhead.
        Return to the starting position as you breathe in by reversing the steps.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Defensive Slide", "Begin in an athletic position with your knees bent and your chest up. Your arms should be in front of your body.
        Shuffle laterally to the right by stepping sideways with your right foot and bringing the left to match.
        As the left foot meets your right, shuffle sideways again.
        Once you've taken 2-3 shuffles, change direction and move to the left.
        Repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Diamond Push-Up", "Get in the modified push-up position on your knees but with your hands together and back flat. Spread your fingers so that your index fingers and thumbs form a diamond, and extend your arms. This is your start position.
        Allow your elbows to break, lowering your chest toward the floor while keeping your back flat.
        Press back up to full arm extension, repeating for the required number of reps.
        To make the movement more difficult, stay up on your toes rather than on your knees.");
        INSERT INTO Workout (title, `desc`) VALUES ("Double Leg Butt Kick", "Begin standing with your knees slightly bent.
        Quickly squat a short distance, flexing the hips and knees, and immediately extend to jump for maximum vertical height.
        As you go up, tuck your heels by flexing the knees, attempting to touch the buttocks.
        Finish the motion by landing with the knees only partially bent, using your legs to absorb the impact.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Bench Press", "Lie down on a flat bench with a dumbbell in each hand resting on top of your thighs. The palms of your hands will be facing each other.
        Then, using your thighs to help raise the dumbbells up, lift the dumbbells one at a time so that you can hold them in front of you at shoulder width.
        Once at shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. The dumbbells should be just to the sides of your chest, with your upper arm and forearm creating a 90 degree angle. Be sure to maintain full control of the dumbbells at all times. This will be your starting position.
        Then, as you breathe out, use your chest to push the dumbbells up. Lock your arms at the top of the lift and squeeze your chest, hold for a second and then begin coming down slowly. Tip: Ideally, lowering the weight should take about twice as long as raising it.
        Repeat the movement for the prescribed amount of repetitions of your training program.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Flyes", "Lie down on a flat bench with a dumbbell on each hand resting on top of your thighs. The palms of your hand will be facing each other.
        Then using your thighs to help raise the dumbbells, lift the dumbbells one at a time so you can hold them in front of you at shoulder width with the palms of your hands facing each other. Raise the dumbbells up like you're pressing them, but stop and hold just before you lock out. This will be your starting position.
        With a slight bend on your elbows in order to prevent stress at the biceps tendon, lower your arms out at both sides in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, the arms should remain stationary; the movement should only occur at the shoulder joint.
        Return your arms back to the starting position as you squeeze your chest muscles and breathe out. Tip: Make sure to use the same arc of motion used to lower the weights.
        Hold for a second at the contracted position and repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Goblet Squat", "From a standing position cradle the head of a dumbbell close to your chest with both hands. You should be looking straight forward, with your shoulders back, your spine straight, and your feet just outside of shoulder width. This will be your starting position.
        Initiate the movement by descending into a squat, flexing the hips and knees to lower your body. Maintain the angle of your torso, paying close attention to the preservation of your spine. As you descend, push your knees outward and keep your weight on your heels.
        descend until you either reach the full squat position with your hamstrings on your calves or until your back starts to round. At the bottom of the motion pause briefly.
        Return to the starting position by driving through your heels, extending the knees and hips to return to the starting position. Repeat the movement for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Lunges", "Stand with your torso upright holding two dumbbells in your hands by your sides. This will be your starting position.
        Step forward with your right leg around 2 feet or so from the foot being left stationary behind and lower your upper body down, while keeping the torso upright and maintaining balance. Inhale as you go down. Note: As in the other exercises, do not allow your knee to go forward beyond your toes as you come down, as this will put undue stress on the knee joint. Make sure that you keep your front shin perpendicular to the ground.
        Using mainly the heel of your foot, push up and go back to the starting position as you exhale.
        Repeat the movement for the recommended amount of repetitions and then perform with the left leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Lying Rear Lateral Raise", "While holding a dumbbell in each hand, lay with your chest down on a slightly inclined (around 15 degrees when measured from the floor) adjustable bench.
        Position the palms of the hands in a neutral manner (palms facing your torso) as you keep the arms extended with the elbows slightly bent. This will be your starting position.
        Now raise the arms to the side until your elbows are at shoulder height and your arms are roughly parallel to the floor as you exhale. Tip: Maintain your arms perpendicular to the torso while keeping them extended throughout the movement. Also, keep the contraction at the top for a second.
        Slowly lower the dumbbells to the starting position as you inhale.
        Repeat for the recommended amount of repetitions and then switch to the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell One-Arm Shoulder Press", "Grab a dumbbell and either sit on a military press bench or a utility bench that has a back support on it as you place the dumbbells upright on top of your thighs or stand up straight.
        Clean the dumbbell up to bring it to shoulder height. The other hand can be kept fully extended to the side, by the waist or grabbing a fixed surface.
        Rotate the wrist so that the palm of your hand is facing forward. This is your starting position.
        As you exhale, push the dumbbell up until your arm is fully extended.
        After a second pause, slowly come down back to the starting position as you inhale.
        Repeat for the recommended amount of repetitions and then switch arms.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell One-Arm Upright Row", "Grab a dumbbell and stand up straight with your arm extended in front of you with a slight bend at the elbows and your back straight. This will be your starting position. Tip: The dumbbell should be resting on top of your thigh with the palm of your hands facing your thighs.
        Keep the other hand can be kept fully extended to the side, by the waist or grabbing a fixed surface. This will be your starting position.
        Use your side shoulders to lift the dumbbell as you exhale. The dumbbell should be close to the body as you move it up. Continue to lift it until the dumbbell is nearly in line with your chin. Tip: Your elbows should drive the motion. As you lift the dumbbell, your elbow should always be higher than your forearm. Also, keep your torso stationary and pause for a second at the top of the movement.
        Lower the dumbbell back down slowly to the starting position. Inhale as you perform this portion of the movement.
        Repeat for the recommended amount of repetitions and switch arms.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Raise", "Grab a dumbbell in each arm and stand up straight with your arms extended by your sides with a slight bend at the elbows and your back straight. This will be your starting position. Tip: The dumbbell should be next to your thighs with the palm of your hands facing back.
        Use your side shoulders to lift the dumbbells as you exhale. The dumbbells should be to the side of the body as you move them up. Continue to lift it until the dumbbells are nearly in line with your chin. Tip: Your elbows should drive the motion. As you lift the dumbbell, your elbow should always be higher than your forearm. Also, keep your torso stationary and pause for a second at the top of the movement.
        Lower the dumbbells back down slowly to the starting position. Inhale as you perform this portion of the movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Seated One-Leg Calf Raise", "Place a block on the floor about 12 inches from a flat bench.
        Sit on a flat bench and place a dumbbell on your upper left thigh about 3 inches above your knee.
        Now place the ball of your left foot on the block. This will be your starting position.
        Raise your toes up as high as possible as you exhale and you contract your calf muscle. Hold the contraction for a second.
        Slowly return to the starting position, stretching as far down as possible.
        Repeat for your prescribed number of repetitions and then repeat with the right leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Shoulder Press", "While holding a dumbbell in each hand, sit on a military press bench or utility bench that has back support. Place the dumbbells upright on top of your thighs.
        Now raise the dumbbells to shoulder height one at a time using your thighs to help propel them up into position.
        Make sure to rotate your wrists so that the palms of your hands are facing forward. This is your starting position.
        Now, exhale and push the dumbbells upward until they touch at the top.
        Then, after a brief pause at the top contracted position, slowly lower the weights back down to the starting position while inhaling.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Shrug", "Stand erect with a dumbbell on each hand (palms facing your torso), arms extended on the sides.
        Lift the dumbbells by elevating the shoulders as high as possible while you exhale. Hold the contraction at the top for a second. Tip: The arms should remain extended at all times. Refrain from using the biceps to help lift the dumbbells. Only the shoulders should be moving up and down.
        Lower the dumbbells back to the original position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Side Lunge", "Stand erect with your feet about shoulder-width apart holding a pair of light-weight dumbbells together in front of you, palms facing in. Your chest should be out, shoulders back, and knees unlocked. Maintain the natural curvature in your back. This is your start position.
        Facing forward throughout and staying as upright as possible, take a big step out to your side, angling your foot just slightly out. descend into a moderately deep squat, keeping the your trailing leg straight.
        Push back up and bring your leg back to the start position.
        Repeat to the opposite side and complete the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Squat", "Stand up straight while holding a dumbbell on each hand (palms facing the side of your legs).
        Position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position. Note: For the purposes of this discussion we will use the medium stance `desc`ribed above which targets overall development; however you can choose any of the three stances discussed in the foot stances section.
        Begin to slowly lower your torso by bending the knees as you maintain a straight posture with the head up. Continue down until your thighs are parallel to the floor. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.
        Begin to raise your torso as you exhale by pushing the floor with the heel of your foot mainly as you straighten the legs again and go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Dumbbell Step Ups", "Stand up straight while holding a dumbbell on each hand (palms facing the side of your legs).
        Place the right foot on the elevated platform. Step on the platform by extending the hip and the knee of your right leg. Use the heel mainly to lift the rest of your body up and place the foot of the left leg on the platform as well. Breathe out as you execute the force required to come up.
        Step down with the left leg by flexing the hip and knee of the right leg as you inhale. Return to the original standing position by placing the right foot of to next to the left foot on the initial position.
        Repeat with the right leg for the recommended amount of repetitions and then perform with the left leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Elliptical Trainer", "To begin, step onto the elliptical and select the desired option from the menu. Most ellipticals have a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Elevation can be adjusted to change the intensity of the workout.
        The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.");
        INSERT INTO Workout (title, `desc`) VALUES ("External Rotation", "Lie sideways on a flat bench with one arm holding a dumbbell and the other hand on top of the bench folded so that you can rest your head on it.
        Bend the elbows of the arm holding the dumbbell so that it creates a 90-degree angle between the upper arm and the forearm. Tip: Keep the arm parallel to your torso.
        Now bend the elbow while keeping the upper arm stationary. In this manner, the forearm will be parallel to the floor and perpendicular to your torso (Tip: So the forearm will be directly in front of you). The upper arm will be stationary by your torso and should be parallel to the floor (aligned with your torso at all times). This will be your starting position.
        As you breathe out, externally rotate your forearm so that the dumbbell is lifted up in a semicircle motion as you maintain the 90 degree angle bend between the upper arms and the forearm. You will continue this external rotation until the forearm is perpendicular to the floor and the torso pointing towards the ceiling. At this point you will hold the contraction for a second.
        As you breathe in, slowly go back to the starting position.
        Repeat for the recommended amount of repetitions and then switch to the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Fast Skipping", "Start in a relaxed position with one leg slightly forward. This will be your starting position.
        Skip by executing a step-hop pattern of right-right-step to left-left-step, and so on, alternating back and forth.
        Perform fast skips by maintaining close contact with the ground and reduce air time, moving as quickly as possible.");
        INSERT INTO Workout (title, `desc`) VALUES ("Feet Jack", "Start with your feet together, arms bent, and elbows at your side.
        At the same time, jump both feet out to the side, allowing your elbows to swing out slightly.
        Immediately reverse the motion by jumping back to the starting position and bringing your elbows back into your side.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Flutter Kicks", "On a flat bench lie facedown with the hips on the edge of the bench, the legs straight with toes high off the floor and with the arms on top of the bench holding on to the front edge.
        Squeeze your glutes and hamstrings and straighten the legs until they are level with the hips. This will be your starting position.
        Start the movement by lifting the left leg higher than the right leg.
        Then lower the left leg as you lift the right leg.
        Continue alternating in this manner (as though you are doing a flutter kick in water) until you have done the recommended amount of repetitions for each leg. Make sure that you keep a controlled movement at all times. Tip: You will breathe normally as you perform this movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("Football Up-Down", "Start with your feet shoulder-width apart and arms bent at your sides.
        Begin to quickly move your feet, as if you were running in place, while keeping your hands in front of you. Maintain this intensity for 5 seconds.
        Next, drop down to the floor in a push up position, letting your abdomen come in contact with the floor. Quickly push up with your arms and bring your feet towards your body to get back up to the starting position.
        Repeat for the recommended amount of repetitions or time.");
        INSERT INTO Workout (title, `desc`) VALUES ("Frog Hops", "Stand with your hands behind your head, and squat down keeping your torso upright and your head up. This will be your starting position.
        Jump forward several feet, avoiding jumping unnecessarily high. As your feet contact the ground, absorb the impact through your legs, and jump again. Repeat this action 5-10 times.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Barbell Squat", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, bring your arms up under the bar while keeping the elbows high and the upper arm slightly above parallel to the floor. Rest the bar on top of the deltoids and cross your arms while grasping the bar for total control.
        Lift the bar off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance `desc`ribed above which targets overall development; however you can choose any of the three stances `desc`ribed in the foot positioning section).
        Begin to slowly lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.
        Begin to raise the bar as you exhale by pushing the floor mainly with the middle of your foot as you straighten the legs again and go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Cable Raise", "Select the weight on a low pulley machine and grasp the single hand cable attachment that is attached to the low pulley with your left hand.
        Face away from the pulley and put your arm straight down with the hand cable attachment in front of your thighs at arms' length with the palms of the hand facing your thighs. This will be your starting position.
        While maintaining the torso stationary (no swinging), lift the left arm to the front with a slight bend on the elbow and the palms of the hand always faces down. Continue to go up until you arm is slightly above parallel to the floor. Exhale as you execute this portion of the movement and pause for a second at the top.
        Now as you inhale lower the arm back down slowly to the starting position.
        Once all of the recommended amount of repetitions have been performed for this arm, switch arms and perform the exercise with the right one.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Dumbbell Raise", "Pick a couple of dumbbells and stand with a straight torso and the dumbbells on front of your thighs at arms length with the palms of the hand facing your thighs. This will be your starting position.
        While maintaining the torso stationary (no swinging), lift the left dumbbell to the front with a slight bend on the elbow and the palms of the hands always facing down. Continue to go up until you arm is slightly above parallel to the floor. Exhale as you execute this portion of the movement and pause for a second at the top. Inhale after the second pause.
        Now lower the dumbbell back down slowly to the starting position as you simultaneously lift the right dumbbell.
        Continue alternating in this fashion until all of the recommended amount of repetitions have been performed for each arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Leg Raises", "Stand next to a chair or other support, holding on with one hand.
        Swing your leg forward, keeping the leg straight. Continue with a downward swing, bringing the leg as far back as your flexibility allows. Repeat 5-10 times, and then switch legs.");
        INSERT INTO Workout (title, `desc`) VALUES ("Front Two-Dumbbell Raise", "Pick a couple of dumbbells and stand with a straight torso and the dumbbells on front of your thighs at arms length with the palms of the hand facing your thighs. This will be your starting position.
        While maintaining the torso stationary (no swinging), lift the dumbbells to the front with a slight bend on the elbow and the palms of the hands always facing down. Continue to go up until you arms are slightly above parallel to the floor. Exhale as you execute this portion of the movement and pause for a second at the top.
        As you inhale, lower the dumbbells back down slowly to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Glute Kickback", "Kneel on the floor or an exercise mat and bend at the waist with your arms extended in front of you (perpendicular to the torso) in order to get into a kneeling push-up position but with the arms spaced at shoulder width. Your head should be looking forward and the bend of the knees should create a 90-degree angle between the hamstrings and the calves. This will be your starting position.
        As you exhale, lift up your right leg until the hamstrings are in line with the back while maintaining the 90-degree angle bend. Contract the glutes throughout this movement and hold the contraction at the top for a second. Tip: At the end of the movement the upper leg should be parallel to the floor while the calf should be perpendicular to it.
        Go back to the initial position as you inhale and now repeat with the left leg.
        Continue to alternate legs until all of the recommended repetitions have been performed.");
        INSERT INTO Workout (title, `desc`) VALUES ("Good Morning", "Begin with a bar on a rack at shoulder height. Rack the bar across the rear of your shoulders as you would a power squat, not on top of your shoulders. Keep your back tight, shoulder blades pinched together, and your knees slightly bent. Step back from the rack.
        Begin by bending at the hips, moving them back as you bend over to near parallel. Keep your back arched and your cervical spine in proper alignment.
        Reverse the motion by extending through the hips with your glutes and hamstrings. Continue until you have returned to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Hand Stand Push-Ups", "With your back to the wall bend at the waist and place both hands on the floor at shoulder width.
        Kick yourself up against the wall with your arms straight. Your body should be upside down with the arms and legs fully extended. Keep your whole body as straight as possible. Tip: If doing this for the first time, have a spotter help you. Also, make sure that you keep facing the wall with your head, rather than looking down.
        Slowly lower yourself to the ground as you inhale until your head almost touches the floor. Tip: It is of utmost importance that you come down slow in order to avoid head injury.
        Push yourself back up slowly as you exhale until your elbows are nearly locked.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Hang Clean", "Begin with a shoulder width, double overhand or hook grip, with the bar hanging at the mid thigh position. Your back should be straight and inclined slightly forward.
        Begin by aggressively extending through the hips, knees and ankles, driving the weight upward. As you do so, shrug your shoulders towards your ears.
        As full extension is achieved, transition into the final pull by aggressively shrugging and flexing the arms with the elbows up and out. At peak extension, aggressively pull yourself down, rotating your elbows under the bar as you do so. Receive the bar in a front squat position, the depth of which is dependent upon the height of the bar at the end of the third pull. The bar should be racked onto the protracted shoulders, lightly touching the throat with the hands relaxed. Continue to descend to the bottom squat position, which will help in the recovery.
        Immediately recover by driving through the heels, keeping the torso upright and elbows up. Continue until you have risen to a standing position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Hang Snatch", "Begin with a wide grip on the bar, with an overhand or hook grip. The feet should be directly below the hips with the feet turned out. Your knees should be slightly bent, and the torso inclined forward. The spine should be fully extended and the head facing forward. The bar should be at the hips. This will be your starting position.
        Aggressively extend through the legs and hips. At peak extension, shrug the shoulders and allow the elbows to flex to the side.
        As you move your feet into the receiving position, forcefully pull yourself below the bar as you elevate the bar overhead. Receive the bar with your body as low as possible and the arms fully extended overhead.
        Return to a standing position with the weight overhead. Follow by returning the weight to the ground under control.");
        INSERT INTO Workout (title, `desc`) VALUES ("Hanging Bar Good Morning", "Begin with a bar on a rack at about the same height as your stomach. Suspend the bar using chains or suspension straps.
        Bend over underneath the bar and rack the bar across the rear of your shoulders as you would a power squat, not on top of your traps. At the proper height, you should be near parallel to the floor when bent over. Keep your back tight, shoulder blades pinched together, and your knees slightly bent. Keep your back arched and your cervical spine in proper alignment.
        Begin the motion by extending through the hips with your glutes and hamstrings, and you are standing with the weight.
        Slowly lower the weight back to the starting position, where it is supported by the chains.");
        INSERT INTO Workout (title, `desc`) VALUES ("High Knee Jog", "Begin in an athletic position with your knees bent, your feet shoulder-width apart, and your arms bent and at your sides.
        Flex the hip and bring your right knee up toward your belly button.
        As the right leg comes down, bring the left knee up.
        Alternate lifting the knees high as you jog in place.");
        INSERT INTO Workout (title, `desc`) VALUES ("Hyperextensions", "Lie face down on a hyperextension bench, tucking your ankles securely under the footpads.
        Adjust the upper pad if possible so your upper thighs lie flat across the wide pad, leaving enough room for you to bend at the waist without any restriction.
        With your body straight, cross your arms in front of you (my preference) or behind your head. This will be your starting position. Tip: You can also hold a weight plate for extra resistance in front of you under your crossed arms.
        Start bending forward slowly at the waist as far as you can while keeping your back flat. Inhale as you perform this movement. Keep moving forward until you feel a nice stretch on the hamstrings and you can no longer keep going without a rounding of the back. Tip: Never round the back as you perform this exercise. Also, some people can go farther than others. The key thing is that you go as far as your body allows you to without rounding the back.
        Slowly raise your torso back to the initial position as you inhale. Tip: Avoid the temptation to arch your back past a straight line. Also, do not swing the torso at any time in order to protect the back from injury.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Ice Skater", "Begin in a standing position with your feet shoulder-width apart. You should be looking directly forward, with your chest up, knees and hips unlocked, and your back straight. This will be your starting position.
        Begin the exercise by jumping to the right with a slight bend in your knees.
        Next, in the same motion, reach down and toward the outside of your right foot with your left hand. Perform this same movement on the opposite side.
        Repeat this movement for the desired number of reps.");
        INSERT INTO Workout (title, `desc`) VALUES ("Inchworm", "Stand with your feet close together. Keeping your legs straight, stretch down and put your hands on the floor directly in front of you. This will be your starting position.
        Begin by walking your hands forward slowly, alternating your left and your right. As you do so, bend only at the hip, keeping your legs straight.
        Keep going until your body is parallel to the ground in a pushup position.
        Now, keep your hands in place and slowly take short steps with your feet, moving only a few inches at a time.
        Continue walking until your feet are by hour hands, keeping your legs straight as you do so.");
        INSERT INTO Workout (title, `desc`) VALUES ("Inverted Row", "Position a bar in a rack to about waist height. You can also use a smith machine.
        Take a wider than shoulder width grip on the bar and position yourself hanging underneath the bar. Your body should be straight with your heels on the ground with your arms fully extended. This will be your starting position.
        Begin by flexing the elbow, pulling your chest towards the bar. Retract your shoulder blades as you perform the movement.
        Pause at the top of the motion, and return yourself to the start position.
        Repeat for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Iron Cross", "Stand with feet shoulder width apart holding a dumbbell in each hand.
        Now lift the arms to your sides so that your torso and the arms form the letter ""T"". The arms should be parallel to the floor and perpendicular to each side of your torso. The palms should be facing forward. This will be your starting position.
        As you inhale slowly squat down by bending at the knees and holding the back erect as if you were going to sit on a chair. Continue with the squat motion until your thighs are parallel to the floor. Tip: Remember that the knees should never go past your toes.
        As you squat down, simultaneously bring the arms in front of you until the palms of the hands are facing each other. Tip: This will look like a flat bench flye but performed standing up. The arms will remain extended throughout the movement and only the shoulder joint will move.
        Now start pressing with the ball of the foot mainly in order to go back to the initial position and simultaneously move the arms out away from your sides in order to form a giant ""T"" as you stand upright. Exhale as you perform this movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Isometric Wipers", "Assume a push-up position, supporting your weight on your hands and toes while keeping your body straight. Your hands should be just outside of shoulder width. This will be your starting position.
        Begin by shifting your body weight as far to one side as possible, allowing the elbow on that side to flex as you lower your body.
        Reverse the motion by extending the flexed arm, pushing yourself up and then dropping to the other side.
        Repeat for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Jog in Place", "Begin standing with your feet shoulder-width apart. Your arms should be bent and at your sides.
        Lift your right knee up until it reaches your waist. Your left arm should swing forward while your right arm swings back. Keep your left knee slightly bent and allow it to spring.
        Return your right foot to the ground as you lift your left knee. Swing your right arm forward and your left arm back. Keep your right knee slightly bent and allow it to spring. Try to keep your weight on your toes as you alternate through the movement.
        Repeat for the recommended amount of repetitions or time.");
        INSERT INTO Workout (title, `desc`) VALUES ("Jogging - Treadmill", "To begin, step onto the treadmill and select the desired option from the menu. Most treadmills have a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Elevation can be adjusted to change the intensity of the workout.");
        INSERT INTO Workout (title, `desc`) VALUES ("Jump Squat", "Start with your arms by your side, feet shoulder width apart, head up, and back straight.
        Keeping your back straight and chest up, squat down as you inhale until your upper thighs are parallel, or lower, to the floor.
        Now pressing mainly with the balls of your feet, jump straight up in the air as high as possible, using the thighs like springs. Exhale during this portion of the movement.
        When you touch the floor again, immediately squat down and jump again. Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Jumping Jacks", "Start by standing with your feet together. In one motion, jump your feet out to the side and raise your arms above your head.
        Immediately reverse the motion by jumping back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Knee Tuck Jump", "Begin in a comfortable standing position with your knees slightly bent. Hold your hands in front of you, palms down with your fingertips together at chest height. This will be your starting position.
        Rapidly dip down into a quarter squat and immediately explode upward. Drive the knees towards the chest, attempting to touch them to the palms of the hands.
        Jump as high as you can, raising your knees up, and then ensure a good land be re-extending your legs, absorbing impact through be allowing the knees to rebend.");
        INSERT INTO Workout (title, `desc`) VALUES ("Leg Extensions", "For this exercise you will need to use a leg extension machine. First choose your weight and sit on the machine with your legs under the pad (feet pointed forward) and the hands holding the side bars. This will be your starting position. Tip: You will need to adjust the pad so that it falls on top of your lower leg (just above your feet). Also, make sure that your legs form a 90-degree angle between the lower and upper leg. If the angle is less than 90-degrees then that means the knee is over the toes which in turn creates undue stress at the knee joint. If the machine is designed that way, either look for another machine or just make sure that when you start executing the exercise you stop going down once you hit the 90-degree angle.
        Using your quadriceps, extend your legs to the maximum as you exhale. Ensure that the rest of the body remains stationary on the seat. Pause a second on the contracted position.
        Slowly lower the weight back to the original position as you inhale, ensuring that you do not go past the 90-degree angle limit.
        Repeat for the recommended amount of times.");
        INSERT INTO Workout (title, `desc`) VALUES ("Leg Lift", "While standing up straight with both feet next to each other at around shoulder width, grab a sturdy surface such as the sides of a squat rack or the top of a chair to brace yourself and keep balance.
        With or without an ankle weight, lift one leg behind you as if performing a leg curl but standing up while keeping the other leg straight. Breathe out as you perform this movement.
        Slowly bring the raised leg back to the floor as you breathe in.
        Repeat for the recommended amount of repetitions.
        Repeat the movement with the opposite leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Leg Press", "Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium (shoulder width) foot stance. (Note: For the purposes of this discussion we will use the medium stance `desc`ribed above which targets overall development; however you can choose any of the three stances `desc`ribed in the foot positioning section).
        Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you. Tip: Make sure that you do not lock your knees. Your torso and the legs should make a perfect 90-degree angle. This will be your starting position.
        As you inhale, slowly lower the platform until your upper and lower legs make a 90-degree angle.
        Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.
        Repeat for the recommended amount of repetitions and ensure to lock the safety pins properly once you are done. You do not want that platform falling on you fully loaded.");
        INSERT INTO Workout (title, `desc`) VALUES ("Low Cable Crossover", "To move into the starting position, place the pulleys at the low position, select the resistance to be used and grasp a handle in each hand.
        Step forward, gaining tension in the pulleys. Your palms should be facing forward, hands below the waist, and your arms straight. This will be your starting position.
        With a slight bend in your arms, draw your hands upward and toward the midline of your body. Your hands should come together in front of your chest, palms facing up.
        Return your arms back to the starting position after a brief pause.");
        INSERT INTO Workout (title, `desc`) VALUES ("Low Pulley Row to Neck", "Sit on a low pulley row machine with a rope attachment.
        Grab the ends of the rope using a palms-down grip and sit with your back straight and your knees slightly bent. Tip: Keep your back almost completely vertical and your arms fully extended in front of you. This will be your starting position.
        While keeping your torso stationary, lift your elbows and start bending them as you pull the rope towards your neck while exhaling. Throughout the movement your upper arms should remain parallel to the floor. Tip: Continue this motion until your hands are almost next to your ears (the forearms will not be parallel to the floor at the end of the movement as they will be angled a bit upwards) and your elbows are out away from your sides.
        After holding for a second or so at the contracted position, come back slowly to the starting position as you inhale. Tip: Again, during no part of the movement should the torso move.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lunge Sprint", "Adjust a bar in a Smith machine to an appropriate height. Position yourself under the bar, racking it across the back of your shoulders. Unrack the bar, and then split your feet, moving one foot forward and one foot back. This will be your starting position.
        Lower your back knee nearly to the ground, flexing the knees and lowering your hips as you do so.
        At the bottom of the `desc`ent, immediately reverse direction. Explosively drive through the heel of your front foot with light pressure from your back foot. Jump up and reverse the position of your legs.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Cambered Barbell Row", "Place a cambered bar underneath an exercise bench.
        Lie face down on the exercise bench and grab the bar using a palms down (pronated grip) that is wider than shoulder width. This will be your starting position.
        As you exhale row the bar up as you keep the elbows close to your body to either your chest, in order to target the upper mid back, or to your stomach if targeting the lats is your goal.
        After a second hold at the top, lower back down to the starting position slowly as you inhale.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Leg Curls", "Adjust the machine lever to fit your height and lie face down on the leg curl machine with the pad of the lever on the back of your legs (just a few inches under the calves). Tip: Preferably use a leg curl machine that is angled as opposed to flat since an angled position is more favorable for hamstrings recruitment.
        Keeping the torso flat on the bench, ensure your legs are fully stretched and grab the side handles of the machine. Position your toes straight (or you can also use any of the other two stances `desc`ribed on the foot positioning section). This will be your starting position.
        As you exhale, curl your legs up as far as possible without lifting the upper legs from the pad. Once you hit the fully contracted position, hold it for a second.
        As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Machine Squat", "Adjust the leg machine to a height that will allow you to get inside it with your knees bent and the thighs slightly below parallel.
        Once you select the weight, position yourself inside the machine face up with the knees bent and thighs slightly below parallel to the platform. Make sure that the knees do not go past the toes. The angle created between the hamstrings and the calves should be one that is slightly less than 90 degrees (since your starting position requires you to start slightly below parallel). Your back and your head should be resting on the machine while your shoulders are pressed under the shoulder pads.
        Place your hands by the handles and position your feet slightly pointing out at a shoulder width position. This will be your starting position.
        While pressing with the balls of the feet as you breathe out, make your whole body erect as you squeeze the quads. Hold the contracted position for a second. Tip: Since you are starting below parallel, you can opt to use your hands to help you up by pressing on your thighs only on the first repetition.
        Slowly squat down as you inhale but instead of going all the way down to the starting position, just stop once your thighs are parallel to the platform. The angle between your hamstrings and calves should be a 90-degree angle.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying One-Arm Lateral Raise", "While holding a dumbbell in one hand, lay with your chest down on a flat bench. The other hand can be used to hold to the leg of the bench for stability.
        Position the palm of the hand that is holding the dumbbell in a neutral manner (palms facing your torso) as you keep the arm extended with the elbow slightly bent. This will be your starting position.
        Now raise the arm with the dumbbell to the side until your elbow is at shoulder height and your arm is roughly parallel to the floor as you exhale. Tip: Maintain your arm perpendicular to the torso while keeping your arm extended throughout the movement. Also, keep the contraction at the top for a second.
        Slowly lower the dumbbell to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Lying Rear Delt Raise", "While holding a dumbbell in each hand, lay with your chest down on a flat bench.
        Position the palms of the hands in a neutral manner (palms facing your torso) as you keep the arms extended with the elbows slightly bent. This will be your starting position.
        Now raise the arms to the side until your elbows are at shoulder height and your arms are roughly parallel to the floor as you exhale. Tip: Maintain your arms perpendicular to the torso while keeping them extended throughout the movement. Also, keep the contraction at the top for a second.
        Slowly lower the dumbbells to the starting position as you inhale.
        Repeat for the recommended amount of repetitions and then switch to the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Bench Press", "Sit down on the Chest Press Machine and select the weight.
        Step on the lever provided by the machine since it will help you to bring the handles forward so that you can grab the handles and fully extend the arms.
        Grab the handles with a palms-down grip and lift your elbows so that your upper arms are parallel to the floor to the sides of your torso. Tip: Your forearms will be pointing forward since you are grabbing the handles. Once you bring the handles forward and extend the arms you will be at the starting position.
        Now bring the handles back towards you as you breathe in.
        Push the handles away from you as you flex your pecs and you breathe out. Hold the contraction for a second before going back to the starting position.
        Repeat for the recommended amount of reps.
        When finished step on the lever again and slowly get the handles back to their original place.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Lateral Raise", "Adjust the machine and select an appropriate load. Seat yourself facing the machine with the base of your upper arm against the pad.
        Maintain a neutral spine with your chest up and head looking forward. This will be your starting position.
        Initiate the movement by moving your upper arms laterally, away from the midline of the body. Continue until your upper arms are parallel to the floor.
        Pause briefly, and then return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Shoulder Press", "Sit down on the Shoulder Press Machine and select the weight.
        Grab the handles to your sides as you keep the elbows bent and in line with your torso. This will be your starting position.
        Now lift the handles as you exhale and you extend the arms fully. At the top of the position make sure that you hold the contraction for a second.
        Lower the handles slowly back to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Machine Squat", "Adjust the weight to an appropriate load for your training.
        With a shoulder-width stance, squat under the shoulder pads and adjust the machine to the appropriate height. Move to a standing position with your back slightly arched, chest up, and head looking forward. This will be your starting position.
        Lower your torso by flexing the hips and the knees.
        Continue until you are below parallel, and then reverse direction by extending the hips and the knees.");
        INSERT INTO Workout (title, `desc`) VALUES ("Man Maker", "Position a pair of light-weight dumbbells in front of you, parallel to each other. Keeping your back flat, bend forward and squat down, grasping the dumbbells. This is your start position.
        Initiate the movement by kicking one leg back, then the other so that you’re in the push-up position, holding onto the dumbbells. Your weight should be on your toes and hands. Do a one-arm row for each side, bringing your elbow up as high as you can.
        Hop your feet forward and rise up by cleaning the weights, bringing them up to shoulder level, palms facing forward as you hop a second time. descend into a squat and explosively rise up, then press the weights overhead to full arm extension.
        Lower the dumbbells back to your shoulders, then bend over as you squat down to return the weights back to the floor in front of you. Repeat for reps.");
        INSERT INTO Workout (title, `desc`) VALUES ("Middle Back Shrug", "Lie facedown on an incline bench while holding a dumbbell in each hand. Your arms should be fully extended hanging down and pointing towards the floor. The palms of your hands should be facing each other. This will be your starting position.
        As you exhale, squeeze your shoulder blades together and hold the contraction for a full second. Tip: This movement is just like the reverse action of a hug, or trying to perform rear laterals as if you had no arms.
        As you inhale go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Mountain Climbers", "Begin in a pushup position, with your weight supported by your hands and toes. Flexing the knee and hip, bring one leg until the knee is approximately under the hip. This will be your starting position.
        Explosively reverse the positions of your legs, extending the bent leg until the leg is straight and supported by the toe, and bringing the other foot up with the hip and knee flexed. Repeat in an alternating fashion for 20-30 seconds.");
        INSERT INTO Workout (title, `desc`) VALUES ("Muscle Snatch", "Begin with a loaded barbell held at the mid thigh position with a wide grip. The feet should be directly below the hips, with the feet turned out as needed. Lower the hips, with the chest up and the head looking forward. The shoulders should be just in front of the bar. This will be the starting position.
        Begin the pull by driving through the front of the heels, raising the bar. Transition into the second pull by extending through the hips knees and ankles, driving the bar up as quickly as possible. The bar should be close to the body.
        Continue raising the bar to the overhead position, without rebending the knees.");
        INSERT INTO Workout (title, `desc`) VALUES ("Natural Glute Ham Raise", "Using the leg pad of a lat pulldown machine or a preacher bench, position yourself so that your ankles are under the pads, knees on the seat, and you are facing away from the machine. You should be upright and maintaining good posture.
        This will be your starting position. Lower yourself under control until your knees are almost completely straight.
        Remaining in control, raise yourself back up to the starting position.
        If you are unable to complete a rep, use a band, a partner, or push off of a box to aid in completing a repetition.");
        INSERT INTO Workout (title, `desc`) VALUES ("One Leg Barbell Squat", "Start by standing about 2 to 3 feet in front of a flat bench with your back facing the bench. Have a barbell in front of you on the floor. Tip: Your feet should be shoulder width apart from each other.
        Bend the knees and use a pronated grip with your hands being wider than shoulder width apart from each other to lift the barbell up until you can rest it on your chest.
        Then lift the barbell over your head and rest it on the base of your neck. Move one foot back so that your toe is resting on the flat bench. Your other foot should be stationary in front of you. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. Tip: Make sure your back is straight and chest is out while performing this exercise.
        As you inhale, slowly lower your leg until your thigh is parallel to the floor. At this point, your knee should be over your toes. Your chest should be directly above the middle of your thigh.
        Leading with the chest and hips and contracting the quadriceps, elevate your leg back to the starting position as you exhale.
        Repeat for the recommended amount of repetitions.
        Switch legs and repeat the movement.");
        INSERT INTO Workout (title, `desc`) VALUES ("One-Arm Dumbbell Row", "Choose a flat bench and place a dumbbell on each side of it.
        Place the right leg on top of the end of the bench, bend your torso forward from the waist until your upper body is parallel to the floor, and place your right hand on the other end of the bench for support.
        Use the left hand to pick up the dumbbell on the floor and hold the weight while keeping your lower back straight. The palm of the hand should be facing your torso. This will be your starting position.
        Pull the resistance straight up to the side of your chest, keeping your upper arm close to your side and keeping the torso stationary. Breathe out as you perform this step. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. Also, make sure that the force is performed with the back muscles and not the arms. Finally, the upper torso should remain stationary and only the arms should move. The forearms should do no other work except for holding the dumbbell; therefore do not try to pull the dumbbell up using the forearms.
        Lower the resistance straight down to the starting position. Breathe in as you perform this step.
        Repeat the movement for the specified amount of repetitions.
        Switch sides and repeat again with the other arm.");
        INSERT INTO Workout (title, `desc`) VALUES ("Pelvic Tilt Into Bridge", "Lie down with your feet on the floor, heels directly under your knees.
        Lift only your tailbone to the ceiling to stretch your lower back. (Don't lift the entire spine yet.) Pull in your stomach.
        To go into a bridge, lift the entire spine except the neck.");
        INSERT INTO Workout (title, `desc`) VALUES ("Plate Row", "Stack the needed number of plates on top of a small plate on the ground, allowing you to easily grip the rims.
        Adopt a shoulder-width stance in front of the plates. Bend at the hip with your knees slightly bent, keeping your back flat. Grab the weights from the side and let them hang below your chest, arms extended. This will be your starting positioning.
        Maintaining a flat back, pull the weights to your chest by flexing the elbows. Do not jerk the weight.
        Return the weight to the starting position and repeat for the desired number of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Power Partials", "Stand up with your torso upright and a dumbbell on each hand being held at arms length. The elbows should be close to the torso.
        The palms of the hands should be facing your torso. Your feet should be about shoulder width apart. This will be your starting position.
        Keeping your arms straight and the torso stationary, lift the weights out to your sides until they are about shoulder level height while exhaling.
        Feel the contraction for a second and begin to lower the weights back down to the starting position while inhaling. Tip: Keep the palms facing down with the little finger slightly higher while lifting and lowering the weights as it will concentrate the stress on your shoulders mainly.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Pull Through", "Begin standing a few feet in front of a low pulley with a rope or handle attached. Face away from the machine, straddling the cable, with your feet set wide apart.
        Begin the movement by reaching through your legs as far as possible, bending at the hips. Keep your knees slightly bent. Keeping your arms straight, extend through the hip to stand straight up. Avoid pulling upward through the shoulders; all of the motion should originate through the hips.");
        INSERT INTO Workout (title, `desc`) VALUES ("Pullups", "Grab the pull-up bar with the palms facing forward using the prescribed grip. Note on grips: For a wide grip, your hands need to be spaced out at a distance wider than your shoulder width. For a medium grip, your hands need to be spaced out at a distance equal to your shoulder width and for a close grip at a distance smaller than your shoulder width.
        As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.
        Pull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.
        After a second on the contracted position, start to inhale and slowly lower your torso back to the starting position when your arms are fully extended and the lats are fully stretched.
        Repeat this motion for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push Press", "Upward Movement Phase:
        Slightly flex the hips and knees, keeping torso erect.
        Immediately follow with an explosive push upward by extending the knees.
        Keep torso erect and tensed.
        At maximum hip and knee extension, shift body weight to balls of feet and extend ankle joints.
        At maximum plantar flexion, push bar from the shoulders.
        Push the bar with the arms to a fully extended elbow position overhead.
        Downward Movement Phase:
        Lower bar to shoulders.
        Flex hips and knees slightly as bar touches shoulders.
        Straighten the hips and knees before the upward movement phase begins again.
        Breathing:
        Exhale through the sticking point of the upward movement phase.
        Inhale during the downward movement phase.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push-Up to Side Plank", "Get into pushup position on the toes with your hands just outside of shoulder width.
        Perform a pushup by allowing the elbows to flex. As you descend, keep your body straight.
        Do one pushup and as you come up, shift your weight on the left side of the body, twist to the side while bringing the right arm up towards the ceiling in a side plank.
        Lower the arm back to the floor for another pushup and then twist to the other side.
        Repeat the series, alternating each side, for 10 or more reps.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push-Up Wide", "With your hands wide apart, support your body on your toes and hands in a plank position. Your elbows should be extended and your body straight. Do not allow your hips to sag. This will be your starting position.
        To begin, allow the elbows to flex, lowering your chest to the floor as you inhale.
        Using your pectoral muscles, press your upper body back up to the starting position by extending the elbows. Exhale as you perform this step.
        After pausing at the contracted position, repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Push-Ups With Feet Elevated", "Lie on the floor face down and place your hands about 36 inches apart from each other holding your torso up at arms length.
        Place your toes on top of a flat bench. This will allow your body to be elevated. Note: The higher the elevation of the flat bench, the higher the resistance of the exercise is.
        Lower yourself until your chest almost touches the floor as you inhale.
        Using your pectoral muscles, press your upper body back up to the starting position and squeeze your chest. Breathe out as you perform this step.
        After a second pause at the contracted position, repeat the movement for the prescribed amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rack Pulls", "Set up in a power rack with the bar on the pins. The pins should be set to the desired point; just below the knees, just above, or in the mid thigh position. Position yourself against the bar in proper deadlifting position. Your feet should be under your hips, your grip shoulder width, back arched, and hips back to engage the hamstrings. Since the weight is typically heavy, you may use a mixed grip, a hook grip, or use straps to aid in holding the weight.
        With your head looking forward, extend through the hips and knees, pulling the weight up and back until lockout. Be sure to pull your shoulders back as you complete the movement.
        Return the weight to the pins and repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rear Leg Raises", "Place yourself on your hands knees on an exercise mat. Your head should be looking forward and the bend of the knees should create a 90-degree angle between the hamstrings and the calves. This will be your starting position.
        Extend one leg up and behind you. The knee and hip should both extend. Repeat for 5-10 repetitions, and then switch sides.");
        INSERT INTO Workout (title, `desc`) VALUES ("Recumbent Bike", "To begin, seat yourself on the bike and adjust the seat to your height.
        Select the desired option from the menu. You may have to start pedaling to turn it on. You can use the manual setting, or you can select a program to use. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. The level of resistance can be changed throughout the workout. The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Flyes", "To begin, lie down on an incline bench with the chest and stomach pressing against the incline. Have the dumbbells in each hand with the palms facing each other (neutral grip).
        Extend the arms in front of you so that they are perpendicular to the angle of the bench. The legs should be stationary while applying pressure with the ball of your toes. This is the starting position.
        Maintaining the slight bend of the elbows, move the weights out and away from each other (to the side) in an arc motion while exhaling. Tip: Try to squeeze your shoulder blades together to get the best results from this exercise.
        The arms should be elevated until they are parallel to the floor.
        Feel the contraction and slowly lower the weights back down to the starting position while inhaling.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Reverse Machine Flyes", "Adjust the handles so that they are fully to the rear. Make an appropriate weight selection and adjust the seat height so the handles are at shoulder level. Grasp the handles with your hands facing inwards. This will be your starting position.
        In a semicircular motion, pull your hands out to your side and back, contracting your rear delts.
        Keep your arms slightly bent throughout the movement, with all of the motion occurring at the shoulder joint.
        Pause at the rear of the movement, and slowly return the weight to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rocket Jump", "Begin in a relaxed stance with your feet shoulder width apart and hold your arms close to the body.
        To initiate the move, squat down halfway and explode back up as high as possible.
        Fully extend your entire body, reaching overhead as far as possible. As you land, absorb your impact through the legs.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rocking Standing Calf Raise", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place it on the back of your shoulders (slightly below the neck).
        Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance. Also maintain a straight back and keep the knees with a slight bend; never locked. This will be your starting position.
        Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending (other than the slight initial bend we created during positioning) at any time. Hold the contracted position by a second before you start to go back down.
        Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.
        Now lift your toes by contracting the tibia muscles in the front of the calves as you breathe out.
        Hold for a second and bring them back down as you breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Romanian Deadlift", "Hold a bar at hip level with a pronated (palms facing down) grip. Your shoulders should be back, your back arched, and your knees slightly bent. This will be your starting position.
        Lower the bar by moving your butt back as far as you can. Keep the bar close to your body, your head looking forward, and your shoulders back. Done correctly, you should reach the maximum range of your hamstring flexibility just below the knee. Any further movement will be compensation and should be avoided for this movement.
        At the bottom of your range of motion, return the starting position by driving the hips forward to stand up tall.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rowing, Stationary", "To begin, seat yourself on the rower. Make sure that your heels are resting comfortably against the base of the foot pedals and that the straps are secured. Select the program that you wish to use, if applicable. Sit up straight and bend forward at the hips.
        There are three phases of movement when using a rower. The first phase is when you come forward on the rower. Your knees are bent and against your chest. Your upper body is leaning slightly forward while still maintaining good posture. Next, push against the foot pedals and extend your legs while bringing your hands to your upper abdominal area, squeezing your shoulders back as you do so. To avoid straining your back, use primarily your leg and hip muscles.
        The recovery phase simply involves straightening your arms, bending the knees, and bringing your body forward again as you transition back into the first phase.");
        INSERT INTO Workout (title, `desc`) VALUES ("Running, Treadmill", "To begin, step onto the treadmill and select the desired option from the menu. Most treadmills have a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Elevation can be adjusted to change the intensity of the workout.
        Treadmills offer convenience, cardiovascular benefits, and usually have less impact than running outside. A 150 lb person will burn over 450 calories running 8 miles per hour for 30 minutes. Maintain proper posture as you run, and only hold onto the handles when necessary, such as when dismounting or checking your heart rate.");
        INSERT INTO Workout (title, `desc`) VALUES ("Scissors Jump", "Assume a lunge stance position with one foot forward with the knee bent, and the rear knee nearly touching the ground.
        Ensure that the front knee is over the midline of the foot. Extending through both legs, jump as high as possible, swinging your arms to gain lift.
        As you jump as high as you can, switch the position of your legs, moving your front leg to the back and the rear leg to the front.
        As you land, absorb the impact through the legs by adopting the lunge position, and repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Barbell Military Press", "Sit on a Military Press Bench with a bar behind your head and either have a spotter give you the bar (better on the rotator cuff this way) or pick it up yourself carefully with a pronated grip (palms facing forward). Tip: Your grip should be wider than shoulder width and it should create a 90-degree angle between the forearm and the upper arm as the barbell goes down.
        Once you pick up the barbell with the correct grip length, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.
        Lower the bar down to the collarbone slowly as you inhale.
        Lift the bar back up to the starting position as you exhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Cable Rows", "For this exercise you will need access to a low pulley row machine with a V-bar. Note: The V-bar will enable you to have a neutral grip where the palms of your hands face each other. To get into the starting position, first sit down on the machine and place your feet on the front platform or crossbar provided making sure that your knees are slightly bent and not locked.
        Lean over as you keep the natural alignment of your back and grab the V-bar handles.
        With your arms extended pull back until your torso is at a 90-degree angle from your legs. Your back should be slightly arched and your chest should be sticking out. You should be feeling a nice stretch on your lats as you hold the bar in front of you. This is the starting position of the exercise.
        Keeping the torso stationary, pull the handles back towards your torso while keeping the arms close to it until you touch the abdominals. Breathe out as you perform that movement. At that point you should be squeezing your back muscles hard. Hold that contraction for a second and slowly go back to the original position while breathing in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Cable Shoulder Press", "Adjust the weight to an appropriate amount and be seated, grasping the handles. Your upper arms should be about 90 degrees to the body, with your head and chest up. The elbows should also be bent to about 90 degrees. This will be your starting position.
        Begin by extending through the elbow, pressing the handles together above your head.
        After pausing at the top, return the handles to the starting position. Ensure that you maintain tension on the cables.
        You can also execute this movement with your back off the pad and alternate hands.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Calf Raise", "Sit on the machine and place your toes on the lower portion of the platform provided with the heels extending off. Choose the toe positioning of your choice (forward, in, or out) as per the beginning of this chapter.
        Place your lower thighs under the lever pad, which will need to be adjusted according to the height of your thighs. Now place your hands on top of the lever pad in order to prevent it from slipping forward.
        Lift the lever slightly by pushing your heels up and release the safety bar. This will be your starting position.
        Slowly lower your heels by bending at the ankles until the calves are fully stretched. Inhale as you perform this movement.
        Raise the heels by extending the ankles as high as possible as you contract the calves and breathe out. Hold the top contraction for a second.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Dumbbell Press", "Grab a couple of dumbbells and sit on a military press bench or a utility bench that has a back support on it as you place the dumbbells upright on top of your thighs.
        Clean the dumbbells up one at a time by using your thighs to bring the dumbbells up to shoulder height at each side.
        Rotate the wrists so that the palms of your hands are facing forward. This is your starting position.
        As you exhale, push the dumbbells up until they touch at the top.
        After a second pause, slowly come down back to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Good Mornings", "Set up a box in a power rack. The pins should be set at an appropriate height. Begin by stepping under the bar and placing it across the back of the shoulders, not on top of your traps. Squeeze your shoulder blades together and rotate your elbows forward, attempting to bend the bar across your shoulders.
        Remove the bar from the rack, creating a tight arch in your lower back. Keep your head facing forward. With your back, shoulders, and core tight, push your knees and butt out and you begin your `desc`ent. Sit back with your hips until you are seated on the box. This will be your starting position.
        Keeping the bar tight, bend forward at the hips as much as possible. If you set the pins to what would be parallel, you not only have a safety if you fail, but know when to stop.
        Pause just above the pins and reverse the motion until your torso it upright.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Leg Curl", "Adjust the machine lever to fit your height and sit on the machine with your back against the back support pad.
        Place the back of lower leg on top of padded lever (just a few inches under the calves) and secure the lap pad against your thighs, just above the knees. Then grasp the side handles on the machine as you point your toes straight (or you can also use any of the other two stances) and ensure that the legs are fully straight right in front of you. This will be your starting position.
        As you exhale, pull the machine lever as far as possible to the back of your thighs by flexing at the knees. Keep your torso stationary at all times. Hold the contracted position for a second.
        Slowly return to the starting position as you breathe in.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Seated Leg Press", "Adjust the bottom position of the machine and seat yourself.
        Select an appropriate load for your training, and then plant your feet a little wider than shoulder width on the platform. Grasp the handles, maintaining good spinal position with your chest up and your head looking forward. This will be your starting position.
        Driving through the heels of your feet, extend through the hips and knees to push the sled upward. Do not lock out your knees.
        After holding the top position for a movement, return to the starting position without fully returning the weight to the stack.");
        INSERT INTO Workout (title, `desc`) VALUES ("Shotgun Row", "Attach a single handle to a low cable.
        After selecting the correct weight, stand a couple feet back with a wide-split stance. Your arm should be extended and your shoulder forward. This will be your starting position.
        Perform the movement by retracting the shoulder and flexing the elbow. As you pull, supinate the wrist, turning the palm upward as you go.
        After a brief pause, return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Side Lateral Raise", "Pick a couple of dumbbells and stand with a straight torso and the dumbbells by your side at arms length with the palms of the hand facing you. This will be your starting position.
        While maintaining the torso in a stationary position (no swinging), lift the dumbbells to your side with a slight bend on the elbow and the hands slightly tilted forward as if pouring water in a glass. Continue to go up until you arms are parallel to the floor. Exhale as you execute this movement and pause for a second at the top.
        Lower the dumbbells back down slowly to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Side Lateral to Front Raise", "In a standing position, hold a pair of dumbbells at your side. This will be your starting position.
        Keeping your elbows slightly bent, raise the weights directly in front of you to shoulder height, avoiding any swinging or cheating.
        At the top of the exercise move the weights out in front of you, keeping your arms extended.
        Lower the weights with a controlled motion.
        On the next repetition, raise the weights in front of you to shoulder height before moving the weights laterally to your sides.
        Lower the weights to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Side Lunge", "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.
        Staying low, take a slow, lateral step to the right. Keep your toes pointed forward and stay low. Extend the left knee, driving your weight to the right, flexing the knee and hip into a side lunge. Maintain good posture through the entire spine, keeping your head and chest up.
        Pause at the bottom of the motion, and then extend through the working leg to return to a standing position, transitioning into a lunge to the opposite side.");
        INSERT INTO Workout (title, `desc`) VALUES ("Single-Arm Push-Up", "Begin laying prone on the ground. Move yourself into a position supporting your weight on your toes and one arm. Your working arm should be placed directly under the shoulder, fully extended. Your legs should be extended, and for this movement you may need a wider base, placing your feet further apart than in a normal push-up.
        Maintain good posture, and place your free hand behind your back. This will be your starting position.
        Lower yourself by allowing the elbow to flex until you touch the ground.
        descend slowly, and reverse direction be extending the arm to return to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Sit Squats", "Stand with your feet shoulder width apart. This will be your starting position.
        Begin the movement by flexing your knees and hips, sitting back with your hips.
        Continue until you have squatted a portion of the way down, but are above parallel, and quickly reverse the motion until you return to the starting position. Repeat for 5-10 repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Slow Jog", "Begin standing with your feet shoulder-width apart. Your arms should be bent and at your sides.
        Lift your right knee up until it reaches your waist. Your left arm should swing forward while your right arm swings back. Keep your left knee slightly bent and allow it to spring.
        Return your right foot to the ground as you lift your left knee. Swing your right arm forward and your left arm back. Keep your right knee slightly bent and allow it to spring.
        Repeat.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Bench Press", "Place a flat bench underneath the smith machine. Now place the barbell at a height that you can reach when lying down and your arms are almost fully extended. Once the weight you need is selected, lie down on the flat bench. Using a pronated grip that is wider than shoulder width, unlock the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.
        As you breathe in, come down slowly until you feel the bar on your middle chest.
        After a second pause, bring the bar back to the starting position as you breathe out and push the bar using your chest muscles. Lock your arms in the contracted position, hold for a second and then start coming down slowly again. Tip: It should take at least twice as long to go down than to come up.
        Repeat the movement for the prescribed amount of repetitions.
        When you are done, lock the bar back in the rack.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Bent Over Row", "Set the barbell attached to the smith machine to a height that is about 2 inches below your knees.
        Bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up.
        Now grasp the barbell using an overhand (pronated) grip and unlock it from the smith machine rack. Then let it hang directly in front of you as your arms hang extended perpendicular to the floor and your torso. This is your starting position.
        While keeping the torso stationary, lift the barbell as you breathe out, keeping the elbows close to the body and not doing any force with the forearm other than holding the weights. On the top contracted position, squeeze the back muscles and hold for a second.
        Slowly lower the weight again to the starting position as you inhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Calf Raise", "Place a block or weight plate below the bar on the Smith machine. Set the bar to a position that best matches your height. Once the correct height is chosen and the bar is loaded, step onto the plates with the balls of your feet and place the bar on the back of your shoulders.
        Take the bar with both hands facing forward. Rotate the bar to unrack it. This will be your starting position.
        Raise your heels as high as possible by pushing off of the balls of your feet, flexing your calf at the top of the contraction. Your knees should remain extended. Hold the contracted position for a second before you start to go back down.
        Return slowly to the starting position as you breathe in while lowering your heels.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Leg Press", "Position a Smith machine bar a couple feet off of the ground. Ensure that it is resting on the safeties. After loading the bar to an appropriate weight, lie underneath the bar. Place the middle of your feet on the bar, tucking your knees to your chest. This will be your starting position.
        Begin the movement by driving through your feet to move the bar upward, extending the hips and knees. Do not lock out your knees.
        At the top of the motion, pause briefly before returning to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Shrug", "To begin, set the bar height on the smith machine around the middle of your thighs. Once the correct height is chosen and the bar is loaded, grab the bar using a pronated grip (palms facing you) shoulder width apart from each other.
        Lift the barbell up and fully extend your arms with your back straight. This is the starting position.
        While exhaling, elevate the bar by raising your shoulders until they come close to touching your ears.
        Hold the contraction for a second before lowering the bar back down to the starting position while inhaling.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Squat", "To begin, first set the bar on the height that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.
        Hold on to the bar using both arms at each side (palms facing forward), unlock it and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times and also maintain a straight back. This will be your starting position. (Note: For the purposes of this discussion we will use the medium stance which targets overall development; however you can choose any of the three stances discussed in the foot stances section).
        Begin to slowly lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees (which is the point in which the upper legs are below parallel to the floor). Inhale as you perform this portion of the movement. Tip: If you performed the exercise correctly, the front of the knees should make an imaginary straight line with the toes that is perpendicular to the front. If your knees are past that imaginary line (if they are past your toes) then you are placing undue stress on the knee and the exercise has been performed incorrectly.
        Begin to raise the bar as you exhale by pushing the floor with the heel of your foot as you straighten the legs again and go back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Smith Machine Stiff-Legged Deadlift", "To begin, set the bar on the smith machine to a height that is around the middle of your thighs. Once the correct height is chosen and the bar is loaded, grasp the bar using a pronated (palms forward) grip that is shoulder width apart. You may need some wrist wraps if using a significant amount of weight.
        Lift the bar up by fully extending your arms while keeping your back straight. Stand with your torso straight and your legs spaced using a shoulder width or narrower stance. The knees should be slightly bent. This is your starting position.
        Keeping the knees stationary, lower the barbell to over the top of your feet by bending at the waist while keeping your back straight. Keep moving forward as if you were going to pick something from the floor until you feel a stretch on the hamstrings. Exhale as you perform this movement
        Start bringing your torso up straight again as soon as you feel the hamstrings stretch by extending your hips and waist until you are back at the starting position. Inhale as you perform this movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Square Hop", "Begin in an athletic position with your knees bent, your feet shoulder-width apart, and your arms bent and at your sides.
        Jump laterally about 2-3 feet to the left.
        Once you land, quickly jump backwards about 2-3 feet.
        When your feet hit the ground, quickly jump laterally to the right about 2-3 feet.
        From there, jump forward 2-3 feet. You should be in the same position you started.
        Repeat this drill by doing the 4 jumps in various directions, but always making a square.");
        INSERT INTO Workout (title, `desc`) VALUES ("Stairmaster", "To begin, step onto the stairmaster and select the desired option from the menu. You can choose a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise.
        Pump your legs up and down in an established rhythm, driving the pedals down but not all the way to the floor. It is recommended that you maintain your grip on the handles so that you don’t fall. The handles can be used to monitor your heart rate to help you stay at an appropriate intensity.
        Stairmasters offer convenience, cardiovascular benefits, and usually have less impact than running outside. They are typically much harder than other cardio equipment. A 150 lb person will typically burn over 300 calories in 30 minutes, compared to about 175 calories walking.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Barbell Calf Raise", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the bar on the back of your shoulders (slightly below the neck).
        Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. The knees should be kept with a slight bend; never locked. This will be your starting position. Tip: For better range of motion you may also place the ball of your feet on a wooden block but be careful as this option requires more balance and a sturdy block.
        Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position by a second before you start to go back down.
        Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Calf Raises", "Adjust the padded lever of the calf raise machine to fit your height.
        Place your shoulders under the pads provided and position your toes facing forward (or using any of the two other positions `desc`ribed at the beginning of the chapter). The balls of your feet should be secured on top of the calf block with the heels extending off it. Push the lever up by extending your hips and knees until your torso is standing erect. The knees should be kept with a slight bend; never locked. Toes should be facing forward, outwards or inwards as `desc`ribed at the beginning of the chapter. This will be your starting position.
        Raise your heels as you breathe out by extending your ankles as high as possible and flexing your calf. Ensure that the knee is kept stationary at all times. There should be no bending at any time. Hold the contracted position by a second before you start to go back down.
        Go back slowly to the starting position as you breathe in by lowering your heels as you bend the ankles until calves are stretched.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Dumbbell Calf Raise", "Stand with your torso upright holding two dumbbells in your hands by your sides. Place the ball of the foot on a sturdy and stable wooden board (that is around 2-3 inches tall) while your heels extend off and touch the floor. This will be your starting position.
        With the toes pointing either straight (to hit all parts equally), inwards (for emphasis on the outer head) or outwards (for emphasis on the inner head), raise the heels off the floor as you exhale by contracting the calves. Hold the top contraction for a second.
        As you inhale, go back to the starting position by slowly lowering the heels.
        Repeat for the recommended amount of times.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Dumbbell Press", "Standing with your feet shoulder width apart, take a dumbbell in each hand. Raise the dumbbells to head height, the elbows out and about 90 degrees. This will be your starting position.
        Maintaining strict technique with no leg drive or leaning back, extend through the elbow to raise the weights together directly above your head.
        Pause, and slowly return the weight to the starting position.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Dumbbell Upright Row", "Grasp a dumbbell in each hand with a pronated (palms forward) grip that is slightly less than shoulder width. The dumbbells should be resting on top of your thighs. Your arms should be extended with a slight bend at the elbows and your back should be straight. This will be your starting position.
        Use your side shoulders to lift the dumbbells as you exhale. The dumbbells should be close to the body as you move it up and the elbows should drive the motion. Continue to lift them until they nearly touch your chin. Tip: Your elbows should drive the motion. As you lift the dumbbells, your elbows should always be higher than your forearms. Also, keep your torso stationary and pause for a second at the top of the movement.
        Lower the dumbbells back down slowly to the starting position. Inhale as you perform this portion of the movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Leg Curl", "Adjust the machine lever to fit your height and lie with your torso bent at the waist facing forward around 30-45 degrees (since an angled position is more favorable for hamstrings recruitment) with the pad of the lever on the back of your right leg (just a few inches under the calves) and the front of the right leg on top of the machine pad.
        Keeping the torso bent forward, ensure your leg is fully stretched and grab the side handles of the machine. Position your toes straight. This will be your starting position.
        As you exhale, curl your right leg up as far as possible without lifting the upper leg from the pad. Once you hit the fully contracted position, hold it for a second.
        As you inhale, bring the legs back to the initial position. Repeat for the recommended amount of repetitions.
        Perform the same exercise now for the left leg.");
        INSERT INTO Workout (title, `desc`) VALUES ("Standing Military Press", "Start by placing a barbell that is about chest high on a squat rack. Once you have selected the weights, grab the barbell using a pronated (palms facing forward) grip. Make sure to grip the bar wider than shoulder width apart from each other.
        Slightly bend the knees and place the barbell on your collar bone. Lift the barbell up keeping it lying on your chest. Take a step back and position your feet shoulder width apart from each other.
        Once you pick up the barbell with the correct grip length, lift the bar up over your head by locking your arms. Hold at about shoulder level and slightly in front of your head. This is your starting position.
        Lower the bar down to the collarbone slowly as you inhale.
        Lift the bar back up to the starting position as you exhale.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Step Mill", "To begin, step onto the stepmill and select the desired option from the menu. You can choose a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Use caution so that you don’t trip as you climb the stairs. It is recommended that you maintain your grip on the handles so that you don’t fall.");
        INSERT INTO Workout (title, `desc`) VALUES ("Stiff Leg Barbell Good Morning", "This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack that best matches your height. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.
        Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
        Step away from the rack and position your legs using a shoulder width medium stance. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position.
        Keeping your legs stationary, move your torso forward by bending at the hips while inhaling. Lower your torso until it is parallel with the floor.
        Begin to raise the bar as you exhale by elevating your torso back to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Stiff-Legged Deadlift", "Grasp a bar on the floor using an overhand grip. Stand with your torso straight and a shoulder-width stance. The knees should be slightly bent. This is your starting position.
        Keeping the knees stationary, lower the barbell to over the top of your feet by bending at the waist while keeping your back arched.
        Continue to the bottom of your hip flexibility without ever compensating through your lumbar in an effort to extend the range of motion. Pause at the bottom and return to the starting position.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Stiff-Legged Dumbbell Deadlift", "Grasp a couple of dumbbells holding them by your side at arm's length.
        Stand with your torso straight and your legs spaced using a shoulder width or narrower stance. The knees should be slightly bent. This is your starting position.
        Keeping the knees stationary, lower the dumbbells to over the top of your feet by bending at the waist while keeping your back straight. Keep moving forward as if you were going to pick something from the floor until you feel a stretch on the hamstrings. Exhale as you perform this movement
        Start bringing your torso up straight again by extending your hips and waist until you are back at the starting position. Inhale as you perform this movement.
        Repeat for the recommended amount of repetitions.");
        INSERT INTO Workout (title, `desc`) VALUES ("Sumo Deadlift", "Begin with a bar loaded on the ground. Approach the bar so that the bar intersects the middle of the feet. The feet should be set very wide, near the collars. Bend at the hips to grip the bar. The arms should be directly below the shoulders, inside the legs, and you can use a pronated grip, a mixed grip, or hook grip. Relax the shoulders, which in effect lengthens your arms.
        Take a breath, and then lower your hips, looking forward with your head with your chest up. Drive through the floor, spreading your feet apart, with your weight on the back half of your feet. Extend through the hips and knees.
        As the bar passes through the knees, lean back and drive the hips into the bar, pulling your shoulder blades together.
        Return the weight to the ground by bending at the hips and controlling the weight on the way down.");
        INSERT INTO Workout (title, `desc`) VALUES ("Superman", "To begin, lie straight and face down on the floor or exercise mat. Your arms should be fully extended in front of you. This is the starting position.
        Simultaneously raise your arms, legs, and chest off of the floor and hold this contraction for 2 seconds. Tip: Squeeze your lower back to get the best results from this exercise. Remember to exhale during this movement. Note: When holding the contracted position, you should look like superman when he is flying.
        Slowly begin to lower your arms, legs and chest back down to the starting position while inhaling.
        Repeat for the recommended amount of repetitions prescribed in your program.");
        INSERT INTO Workout (title, `desc`) VALUES ("Trail Running/Walking", "Running or hiking on trails will get the blood pumping and heart beating almost immediately. Make sure you have good shoes. While you use the muscles in your calves and buttocks to pull yourself up a hill, the knees, joints and ankles absorb the bulk of the pounding coming back down. Take smaller steps as you walk downhill, keep your knees bent to reduce the impact and slow down to avoid falling.");
        INSERT INTO Workout (title, `desc`) VALUES ("Walking, Treadmill", "To begin, step onto the treadmill and select the desired option from the menu. Most treadmills have a manual setting, or you can select a program to run. Typically, you can enter your age and weight to estimate the amount of calories burned during exercise. Elevation can be adjusted to change the intensity of the workout.
        ");
        INSERT INTO Workout (title, `desc`) VALUES ("Aerobic Dance", "Aerobic dance classes can be very effective for cardio training.");
        INSERT INTO Workout (title, `desc`) VALUES ("Swimming", "Swimming is an activity that can be both useful and recreational.");
        INSERT INTO Workout (title, `desc`) VALUES ("Cycling", "Cycling is the use of bicycles for transportation, recreation, exercise, or sport.");
        INSERT INTO Workout (title, `desc`) VALUES ("Rollerblading", "Rollerblading is a fun and exciting activity that involves skating while wearing inline skates, or rollerblades. Rollerblading exercises require balancing and moving the lower body in order to move on a pair of skates.");

        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (1, 1);
        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (1, 2);
        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (1, 3);
        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (2, 4);
        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (2, 5);
        insert into Achievements_Completed(User_user_id, Achievements_achieve_id) values (2, 6);

        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (1, 1, 1, 10, 1, 40, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (2, 2, 2, 10, 2, 70, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (3, 3, 3, 13, 3, 85, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (4, 4, 4, 10, 3, 40, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (5, 5, 5, 10, 2, 120, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (6, 6, 6, 10, 2, 45, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (7, 7, 7, 10, 3, 15, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (8, 8, 1, 10, 1, 145, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (9, 9, 2, 10, 2, 180, NULL);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (10, 10, 3, NULL, NULL, NULL, 10);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (11, 11, 1, NULL, NULL, NULL, 30);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (12, 11, 2, NULL, NULL, NULL, 120);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (13, 11, 4, NULL, NULL, NULL, 50);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (14, 11, 5, NULL, NULL, NULL, 20);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (15, 11, 1, NULL, NULL, NULL, 15);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (16, 11, 5, NULL, NULL, NULL, 35);
        insert into Faved_Workouts(fav_id, Workout_workout_id, User_user_id, reps, sets, weight, duration) values (17, 11, 4, NULL, NULL, NULL, 40);

        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (1, 1, 1, '2013-01-19 03:14:07', 10, 10, 10, 10);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (2, 1, 1, '2012-01-19 03:14:07', 20, 20, 20, 20);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (3, 1, 1, '2011-01-19 03:14:07', 30, 30, 30, 30);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (4, 2, 1, '2013-01-19 03:14:07', 40, 40, 40, 40);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (5, 2, 1, '2012-01-19 03:14:07', 50, 50, 50, 50);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (6, 2, 1, '2011-01-19 03:14:07', 60, 60, 60, 60);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (7, 1, 2, '2013-01-19 03:14:07', 70, 70, 70, 70);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (8, 1, 2, '2012-01-19 03:14:07', 80, 80, 80, 80);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (9, 1, 2, '2011-01-19 03:14:07', 90, 90, 90, 90);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (10, 2, 2, '2013-01-19 03:14:07', 100, 100, 100, 100);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (11, 2, 2, '2012-01-19 03:14:07', 110, 110, 110, 110);
        insert into Workout_History(hist_id, Workout_workout_id, User_user_id, time_stamp, duration, reps, sets, weight) values (12, 2, 2, '2011-01-19 03:14:07', 120, 120, 120, 120);


        INSERT INTO Types(type_id, name) VALUES (1, 'Back');
        INSERT INTO Types(type_id, name) VALUES (2, 'Arms');
        INSERT INTO Types(type_id, name) VALUES (3, 'Shoulders');
        INSERT INTO Types(type_id, name) VALUES (4, 'Legs');
        INSERT INTO Types(type_id, name) VALUES (5, 'Cardio');
        INSERT INTO Types(type_id, name) VALUES (6, 'Chest');

        -- add workout id and category id to Is_Type table
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 1);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 2);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 3);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 4);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 4);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 4);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 5);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 5);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 6);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 6);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 6);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 7);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 8);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 9);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 10);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 11);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 11);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 11);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 12);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 12);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 12);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 13);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 14);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 14);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 14);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 15);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 16);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 17);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 18);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 19);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 19);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 19);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 20);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 21);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 21);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 21);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 22);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 23);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 24);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 25);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 26);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 26);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 26);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 27);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 28);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 29);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 30);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 31);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 32);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 32);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 32);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 33);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 34);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 35);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 36);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 37);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 38);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 38);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 38);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 39);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 40);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 40);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 40);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 41);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 42);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 43);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 44);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 44);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 44);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 45);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 46);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 47);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 47);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 47);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 48);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 49);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 50);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 51);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 52);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 52);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 52);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 53);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 54);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 55);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 56);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 57);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 58);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 59);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 60);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 61);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 62);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 63);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 63);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 63);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 64);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 65);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 66);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 67);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 68);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 69);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 69);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 70);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 70);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 71);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 71);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 72);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 72);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 73);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 73);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 73);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 74);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 74);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 74);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 75);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 75);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 76);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 77);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 77);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 78);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 79);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 80);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 81);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 81);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 81);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 82);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 83);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 84);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 84);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 84);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 85);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 86);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 86);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 86);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 87);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 87);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 88);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 89);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 90);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 90);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 90);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 90);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 91);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 92);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 93);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 93);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 93);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 94);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 94);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 94);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 95);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 95);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 95);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 95);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 96);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 96);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 96);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 96);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 97);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 97);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 98);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 100);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 101);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 102);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 102);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 103);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 103);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 103);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 103);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 104);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 105);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 106);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 107);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 107);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 107);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 108);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 108);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 109);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 109);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 109);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 110);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 111);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 112);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 113);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 114);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 114);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 115);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 115);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 116);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 117);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 118);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 118);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 119);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 119);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 120);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 120);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 120);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 121);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 121);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 121);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 121);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 122);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 122);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 122);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 122);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 123);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 123);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 123);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 123);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 124);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 124);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 125);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 125);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 125);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 126);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 126);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 126);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 127);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 127);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 127);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 128);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 128);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 129);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 130);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 130);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 131);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 131);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 132);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 133);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 133);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 133);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 134);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 135);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 136);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 137);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 138);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 139);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 139);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 140);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 140);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 141);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 142);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 142);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 143);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 144);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 145);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 145);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 146);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 147);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 148);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 149);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 150);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 151);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 152);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 152);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 152);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 152);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 153);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 154);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 155);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 156);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 157);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 158);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 159);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 160);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 160);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 161);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 161);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 162);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 162);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 162);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 162);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 163);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 163);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 163);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 163);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 164);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 164);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 165);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 165);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 166);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 166);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 167);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 168);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 169);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 170);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 170);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 170);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 170);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 171);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 171);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 171);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 172);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 172);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 173);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 173);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 174);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 175);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 175);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 176);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 177);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 178);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 179);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 180);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 180);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 181);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 181);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 181);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 182);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 183);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 183);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 183);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 184);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 185);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 186);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 187);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 188);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 188);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 188);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 189);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 190);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 190);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 191);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 192);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 192);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 193);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 194);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 194);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 194);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 195);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 195);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 195);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 195);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 196);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 196);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 197);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 198);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 198);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 198);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 199);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 200);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 200);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 200);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 201);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 202);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 202);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 203);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 203);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 204);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 204);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 204);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 205);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 205);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 205);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 206);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 206);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 206);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 207);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 207);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 207);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 208);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 208);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 208);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 209);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 210);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 210);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 211);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 212);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 213);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 214);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 215);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 216);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 216);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 216);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 217);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 217);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 218);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 219);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 219);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 220);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 220);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 221);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 221);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 222);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 223);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 223);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 224);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 224);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 225);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 226);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 227);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 227);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 228);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 229);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 229);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 230);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 231);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 231);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 231);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 232);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 233);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 233);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (6, 234);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 234);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 234);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 235);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 235);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 235);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 236);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 237);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 238);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 238);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 239);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 239);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 240);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 240);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 241);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 242);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 242);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 243);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 244);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 245);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 246);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 246);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 247);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 247);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 248);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 249);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 249);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 250);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 250);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 251);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 252);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 252);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 253);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 253);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 254);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 254);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 254);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 254);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 255);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 255);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 256);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 256);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 257);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 257);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 258);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 258);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 258);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (1, 258);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 259);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 259);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (2, 259);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (3, 259);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 260);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 260);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (5, 261);
        INSERT INTO Is_Type (Types_type_id, Workout_workout_id) VALUES (4, 261);

-- End of file.
