/* Create Pickleball 2023-2024 Table */
CREATE TABLE Pickleball_2023_2024 (
Session_ID INT Primary KEY,
Date Date,
Location VARCHAR(100),
Court_Name VARCHAR(100),
Time_Spent_Mins INT,
Session_Type VARCHAR(100),
Court_Type VARCHAR(100)
);

BULK INSERT Pickleball_2023_2024
FROM 'C:\Users\kevin\Desktop\Pickleball 2023-2024 Raw Data csv.csv'
WITH (FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR='\n',
BATCHSIZE=250000,
MAXERRORS=2);

SELECT * FROM Pickleball_2023_2024;

/* Time */
What is the total time spent in minutes? 28410
What is the total time spent in hours? 473
SELECT SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time_Mins, SUM(Pickleball_2023_2024.Time_Spent_Mins) / 60 AS Total_Time_Hours
FROM Pickleball_2023_2024
;

What is the total time spent at recreation vs. drills? 19380(323) vs. 9030(150)
SELECT SUM(Pickleball_2023_2024.Time_Spent_Mins) / 60 AS Total_Time_Recreation
FROM Pickleball_2023_2024
WHERE Session_Type = 'Recreation'
;
SELECT SUM(Pickleball_2023_2024.Time_Spent_Mins) / 60 AS Total_Time_Drill
FROM Pickleball_2023_2024
WHERE Session_Type = 'Drill'
;

What is the total time spent indoors versus outdoors? 3480(58) vs. 24930(415)
SELECT SUM(Pickleball_2023_2024.Time_Spent_Mins) / 60 AS Total_Time_Indoors
FROM Pickleball_2023_2024
WHERE Court_Type = 'Indoors'
;
SELECT SUM(Pickleball_2023_2024.Time_Spent_Mins) / 60 AS Total_Time_Outdoors
FROM Pickleball_2023_2024
WHERE Court_Type = 'Outdoors'
;

What is the average time spent per session? 135
What is the range of time spent per session? 30 to 480
SELECT AVG(Pickleball_2023_2024.Time_Spent_Mins) AS Average_Time_Session, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Time_Session, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Time_Session
FROM Pickleball_2023_2024
;

What is the count, sum, average, and range of time spent at each frequented court?
Beach_Elementary - 1 sessions, 2 hours, 120 minutes, 120 min/sess, 120-120
Beresford_Park - 2 sessions, 1.5 hours, 90 minutes, 45 min/sess, 30-60
Bicentennial_Park - 2 sessions, 5 hours, 330 minutes, 165 min/sess, 90-240
Brommer_Park - 1 sessions, 0.5 hours, 30 minutes, 30 min/sess, 30-30
Cady_Way - 12 sessions, 41 hours, 2460 minutes, 205 min/sess, 120-480
Campbbell_Green - 5 sessions, 13 hours, 780 minutes, 156 min/sess, 60-210
Central_Winds_Park - 1 sessions, 4 hours, 240 minutes, 240 min/sess, 240-240
ClearOne - 5 sessions, 8 hours, 510 minutes, 102 min/sess, 60-150
Dover_Shores - 17 sessions, 45 hours, 2700 minutes, 158 min/sess, 60-270
Eagle_Nest_Park - 1 sessions, 1.5 hours, 90 minutes, 90 min/sess, 90-90
East_Park - 16 sessions, 21 hours, 1290 minutes, 80 min/sess, 60-180
Finch - 1 sessions, 1.5 hours, 90 minutes, 90 min/sess, 90-90
Godwin_Park - 10 sessions, 26 hours, 1590 minutes, 159 min/sess, 30-300
JW_Cate_Park - 1 sessions, 1 hours, 60 minutes, 60 min/sess, 60-60
Laureate_Park - 1 sessions, 2 hours, 120 minutes, 120 min/sess, 120-120
Louis_Sutter_Park - 1 sessions, 1 hour, 60 minutes, 60 min/sess, 60-60
Mickeys_Retreat - 10 sessions, 12 hours, 720 minutes, 72 min/sess, 30-120
North_Lake_Park - 1 sessions, 2 hours, 120 minutes, 120 min/sess, 120-120
Oak_Street_Park - 73 sessions, 183 hours, 11010 minutes, 150 min/sess, 30-420
Orlando_Racquet_Sports - 17 sessions, 49 hours, 2970 minutes, 174 min/sess, 60-360
Prime_Apartments - 1 sessions, 2 hours, 120 minutes, 120 min/sess, 120-120
Rowlett_Park - 2 sessions, 3 hours, 180 minutes, 90 min/sess, 30-150
USTA - 25 sessions, 39 hours, 2340 minutes, 93 min/sess, 60-180
Veterans_Memorial_Park - 3 sessions, 6 hours, 390 minutes, 130 min/sess, 90-180

SELECT Pickleball_2023_2024.Court_Name, COUNT(Pickleball_2023_2024.Court_Name) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 as Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) as Total_Time_Mins, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Time_Per_Court, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Time_Per_Court, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Time_Per_Court
FROM Pickleball_2023_2024
GROUP BY Pickleball_2023_2024.Court_Name
;

What is the least vs most consistent months?
October - 1 sessions, 1 hours, 60 minutes, 60 min/sess, 60-60
November - 14 sessions, 47 hours, 2820 minutes, 201 min/sess, 90-420
December - 18 sessions, 34 hours, 2040 minutes, 113 min/sess, 30-180
January - 36 sessions, 94 hours, 5640 minutes, 156 min/sess, 60-300
February - 45 sessions, 95 hours, 5730 minutes, 127 min/sess, 30-270
March - 41 sessions, 93 hours, 5610 minutes, 136 mins/sess, 60-360
April - 28 sessions, 50 hours, 3000 minutes, 107 mins/sess, 30-240
May - 26 sessions, 58 hours, 3510 minutes, 135 mins/sess, 30-480
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time_Mins, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2023-10-01' AND '2023-10-31')

;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2023-11-01' AND '2023-11-30')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2023-12-01' AND '2023-12-31')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2024-01-01' AND '2024-01-31')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2024-02-01' AND '2024-02-29')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2024-03-01' AND '2024-03-31')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2024-04-01' AND '2024-04-30')
;
SELECT COUNT(Pickleball_2023_2024.Date) AS Total_Sessions, SUM(Pickleball_2023_2024.Time_Spent_Mins)/60 AS Total_Time_Hours, SUM(Pickleball_2023_2024.Time_Spent_Mins) AS Total_Time, AVG(Pickleball_2023_2024.Time_Spent_Mins) AS AVG_Total_Time, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Total_Time, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Total_Time
FROM Pickleball_2023_2024
WHERE (Pickleball_2023_2024.Date BETWEEN '2024-05-01' AND '2024-05-31')
;

What are the top 5 courts used? Oak_Street(73), USTA(25), Orlando_Racquet_Sports(17), Dover_Shores(17), East_Park(16)
SELECT Pickleball_2023_2024.Court_Name, COUNT(Pickleball_2023_2024.Court_Name) AS TOTAL_Sessions
FROM Pickleball_2023_2024
GROUP BY Pickleball_2023_2024.Court_Name
ORDER BY TOTAL_Sessions DESC
;

/* Location */
How many sessions in each state?
What is the average session time in each state?
What is the range session time in each state?
Florida - 198 sessions, 137 min/sess, 30-480
California - 5 sessions, 60 min/sess, 30-120
Texas - 6 sessions, 145 min/sess, 60-210
SELECT AVG(Pickleball_2023_2024.Time_Spent_Mins) AS Average_Session_Florida, COUNT(Pickleball_2023_2024.Location) AS Sessions_In_Florida, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Session, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Session
FROM Pickleball_2023_2024
WHERE Pickleball_2023_2024.Location LIKE '%Florida%'
;
SELECT AVG(Pickleball_2023_2024.Time_Spent_Mins) AS Average_Session_California, COUNT(Pickleball_2023_2024.Location) AS Sessions_In_California, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Session, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Session
FROM Pickleball_2023_2024
WHERE Pickleball_2023_2024.Location LIKE '%California%'
;
SELECT AVG(Pickleball_2023_2024.Time_Spent_Mins) AS Average_Session_Texas, COUNT(Pickleball_2023_2024.Location) AS Sessions_In_Texas, MIN(Pickleball_2023_2024.Time_Spent_Mins) AS MIN_Session, MAX(Pickleball_2023_2024.Time_Spent_Mins) AS MAX_Session
FROM Pickleball_2023_2024
WHERE Pickleball_2023_2024.Location LIKE '%Texas%'
;

How many different courts visited thus far? 24
SELECT DISTINCT Pickleball_2023_2024.Court_Name AS Total_Different_Courts
FROM Pickleball_2023_2024
GROUP BY Pickleball_2023_2024.Court_Name
;
