CREATE DATABASE Resourse_As

USE Resourse_As

CREATE TABLE Account (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    name NVARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255)
);


CREATE TABLE Resource (
    title NVARCHAR(255),
    author VARCHAR(255),
	resource_name VARCHAR(255),
    description NVARCHAR(255)
);

CREATE TABLE Comment (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    user_id INT,
    resource_id INT,
    comment_content VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Account(id),
);

CREATE TABLE UserContribution (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    user_id INT,
    resource_id INT,
    title NVARCHAR(255),
    resource_name VARCHAR(255),
    description NVARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Account(id),
);

CREATE TABLE CV (
    id INT IDENTITY(1,1) PRIMARY KEY ,
    user_id INT,
	cv_content NVARCHAR(255),
    resource_name NVARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Account(id)
);

-- Inserting data into the Account table
INSERT INTO Account (name, password, email)
VALUES 
    ('John Doe', 'password123', 'john.doe@example.com'),
    ('Jane Smith', 'abc123', 'jane.smith@example.com'),
    ('David Johnson', 'pass456', 'david.johnson@example.com'),
    ('Sarah Williams', 'qwerty', 'sarah.williams@example.com'),
    ('Michael Brown', 'hello123', 'michael.brown@example.com');

-- Inserting data into the Resource table
INSERT INTO Resource (title, author, resource_name, description)
VALUES 
    ('Introduction to SQL', 'John Doe', 'sql_intro.pdf', 'A beginner-friendly guide to SQL'),
    ('Python Programming', 'Jane Smith', 'python_programming.pdf', 'An introduction to Python programming'),
    ('Web Development Basics', 'David Johnson', 'web_dev_basics.pdf', 'Learn the fundamentals of web development'),
    ('Data Analysis Techniques', 'Sarah Williams', 'data_analysis.pdf', 'Analyzing data using statistical methods'),
    ('JavaScript Essentials', 'Michael Brown', 'javascript_essentials.pdf', 'A comprehensive guide to JavaScript');

-- Inserting data into the Comment table
INSERT INTO Comment (user_id, resource_id, comment_content)
VALUES 
    (1, 1, 'This resource was very helpful.'),
    (2, 1, 'I learned a lot from this guide.'),
    (3, 2, 'Python programming is my favorite.'),
    (4, 3, 'Great resource for web development beginners.'),
    (5, 4, 'The data analysis techniques explained here are fantastic.');

-- Inserting data into the UserContribution table
INSERT INTO UserContribution (user_id, resource_id, title, resource_name, description)
VALUES 
    (1, 1, 'Advanced SQL Techniques', 'advanced_sql.pdf', 'Exploring advanced SQL concepts.'),
    (2, 2, 'Python for Data Science', 'python_data_science.pdf', 'Applying Python to analyze and visualize data.'),
    (3, 3, 'Responsive Web Design', 'responsive_web_design.pdf', 'Building websites that adapt to different devices.'),
    (4, 4, 'Data Visualization with Python', 'data_visualization.pdf', 'Creating informative and visually appealing data visualizations.'),
    (5, 5, 'Object-Oriented JavaScript', 'javascript_oop.pdf', 'Mastering object-oriented programming in JavaScript.');

-- Inserting data into the CV table
INSERT INTO CV (user_id, cv_content, resource_name)
VALUES 
    (1, 'Education: BSc Computer Science', 'john_doe_cv.pdf'),
    (2, 'Education: BEng Software Engineering', 'jane_smith_cv.pdf'),
    (3, 'Education: MSc Data Science', 'david_johnson_cv.pdf'),
    (4, 'Education: BSc Web Development', 'sarah_williams_cv.pdf'),
    (5, 'Education: BSc Computer Science', 'michael_brown_cv.pdf');
