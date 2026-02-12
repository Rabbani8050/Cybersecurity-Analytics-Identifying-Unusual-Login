CREATE DATABASE user_management;
USE user_management;

CREATE TABLE login_activity (
    user_id VARCHAR(10),
    login_time DATETIME,
    logout_time DATETIME,
    ip_address VARCHAR(20),
    country VARCHAR(50),
    city VARCHAR(50),
    login_status VARCHAR(10),
    device_type VARCHAR(20),
    failed_attempts INT
);

-- Users with multiple failed attempts
SELECT user_id, SUM(failed_attempts) AS total_failed
FROM login_activity
GROUP BY user_id
HAVING total_failed >= 3;

-- Logins from foreign countries
SELECT *
FROM login_activity
WHERE country != 'India';

-- Odd hour logins (12 AM – 5 AM)
SELECT *
FROM login_activity
WHERE HOUR(login_time) BETWEEN 0 AND 5;


