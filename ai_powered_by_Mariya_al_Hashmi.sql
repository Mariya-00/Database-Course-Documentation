create database aiOps;
use aiOps;

-- Table 1: Servers 
CREATE TABLE Servers ( 
    server_id INT PRIMARY KEY, 
    server_name VARCHAR(50), 
    region VARCHAR(50) 
); 
INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 
-- Table 2: Alerts 
CREATE TABLE Alerts ( 
    alert_id INT PRIMARY KEY, 
    server_id INT, 
    alert_type VARCHAR(50), 
    severity VARCHAR(20) 
); 
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 
-- Table 3: AI Models 
CREATE TABLE AI_Models ( 
    model_id INT PRIMARY KEY, 
    model_name VARCHAR(50), 
    use_case VARCHAR(50) 
); 
INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 
-- Table 4: ModelDeployments 
CREATE TABLE ModelDeployments ( 
    deployment_id INT PRIMARY KEY, 
    server_id INT, 
    model_id INT, 
    deployed_on DATE 
); 
 
INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12');  

-- Task 1: INNER JOIN 
SELECT a.alert_id, a.alert_type, a.severity, s.server_name
FROM Alerts a
INNER JOIN Servers s ON a.server_id = s.server_id;

-- Task 2: LEFT JOIN 
SELECT s.server_id, s.server_name, s.region, a.alert_type, a.severity
FROM Servers s
LEFT JOIN Alerts a ON s.server_id = a.server_id;

-- Task 3: RIGHT JOIN 
SELECT s.server_name, a.alert_id, a.alert_type, a.severity
FROM Servers s
RIGHT JOIN Alerts a ON s.server_id = a.server_id;

-- Task 4: FULL OUTER JOIN 
SELECT s.server_name, a.alert_type, a.severity
FROM Servers s
FULL OUTER JOIN Alerts a ON s.server_id = a.server_id;

-- Task 5: CROSS JOIN
SELECT m.model_name, s.server_name
FROM AI_Models m
CROSS JOIN Servers s;

-- Task 6: INNER JOIN with Filter
SELECT a.alert_id, a.alert_type, a.severity, s.server_name
FROM Alerts a
INNER JOIN Servers s ON a.server_id = s.server_id
WHERE a.severity = 'Critical';

-- Task 7: LEFT JOIN with NULL filter
SELECT s.server_id, s.server_name
FROM Servers s
LEFT JOIN ModelDeployments md ON s.server_id = md.server_id
WHERE md.deployment_id IS NULL;

-- Task 8: CROSS JOIN with WHERE 
SELECT s.server_name, m.model_name
FROM Servers s
CROSS JOIN AI_Models m
WHERE s.region LIKE 'eu-%';