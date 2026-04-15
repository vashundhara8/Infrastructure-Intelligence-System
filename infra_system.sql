DROP DATABASE IF EXISTS infra_system;
CREATE DATABASE infra_system;
USE infra_system;



-- ===============================
-- DATABASE CREATION
-- ===============================
CREATE DATABASE IF NOT EXISTS infra_system;
USE infra_system;

-- ===============================
-- TABLE CREATION
-- ===============================

CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    area_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE Issue_Types (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_name VARCHAR(50) NOT NULL
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    issue_id INT,
    dept_id INT,
    reported_date DATE,
    resolved_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (location_id) REFERENCES Locations(location_id),
    FOREIGN KEY (issue_id) REFERENCES Issue_Types(issue_id),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- ===============================
-- INSERT DATA
-- ===============================

INSERT INTO Locations (area_name, city) VALUES
('Yelahanka', 'Bangalore'),
('Whitefield', 'Bangalore'),
('BTM Layout', 'Bangalore'),
('Indiranagar', 'Bangalore'),
('Electronic City', 'Bangalore');

INSERT INTO Issue_Types (issue_name) VALUES
('Pothole'),
('Garbage'),
('Water Leakage'),
('Streetlight Failure'),
('Sewage Issue');

INSERT INTO Departments (dept_name) VALUES
('Road Department'),
('Municipal Waste'),
('Water Supply'),
('Electricity Board'),
('Sewage Department');

INSERT INTO Complaints 
(location_id, issue_id, dept_id, reported_date, resolved_date, status)
VALUES
(1,1,1,'2026-04-01',NULL,'Pending'),
(2,2,2,'2026-03-20','2026-03-25','Resolved'),
(3,3,3,'2026-04-02',NULL,'Pending'),
(4,4,4,'2026-03-15','2026-03-18','Resolved'),
(5,5,5,'2026-04-05',NULL,'Pending');

-- ===============================
-- ANALYSIS QUERIES
-- ===============================

-- 1. View all complaints
SELECT * FROM Complaints;

-- 2. Find delayed complaints (more than 7 days)
SELECT *
FROM Complaints
WHERE status = 'Pending'
AND DATEDIFF(CURDATE(), reported_date) > 7;

-- 3. Area-wise complaint count
SELECT l.area_name, COUNT(*) AS total_issues
FROM Complaints c
JOIN Locations l ON c.location_id = l.location_id
GROUP BY l.area_name
ORDER BY total_issues DESC;

-- 4. Department-wise average resolution time
SELECT d.dept_name,
AVG(DATEDIFF(resolved_date, reported_date)) AS avg_resolution_days
FROM Complaints c
JOIN Departments d ON c.dept_id = d.dept_id
WHERE status = 'Resolved'
GROUP BY d.dept_name;

-- ===============================
-- VIEWS (FOR POWER BI)
-- ===============================

CREATE VIEW area_summary AS
SELECT l.area_name, COUNT(*) AS total_complaints
FROM Complaints c
JOIN Locations l ON c.location_id = l.location_id
GROUP BY l.area_name;

CREATE VIEW delay_summary AS
SELECT complaint_id,
DATEDIFF(CURDATE(), reported_date) AS delay_days
FROM Complaints
WHERE status = 'Pending';