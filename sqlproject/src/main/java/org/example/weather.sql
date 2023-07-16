CREATE TABLE Weather (
  temp_id INT PRIMARY KEY,
  record_Date DATE,
  temperature INT
);

INSERT INTO Weather (temp_id, record_Date, temperature)
VALUES
  (1, '2015-01-01', 10),
  (2, '2015-01-02', 25),
  (3, '2015-01-03', 20),
  (4, '2015-01-04', 30);
SELECT t1.temp_id
FROM Weather t1
JOIN Weather t2 ON t1.record_Date = DATE_ADD(t2.record_Date, INTERVAL 1 DAY)
WHERE t1.temperature > t2.temperature;
