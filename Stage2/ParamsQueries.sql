/*Find soldiers with the most trips in a given year*/
SELECT S.SoldierID, S.Name_, COUNT(*) AS TripCount
FROM Soldier S
JOIN HasTrips HT ON S.SoldierID = HT.SoldierID
JOIN Trip T ON HT.TripID = T.TripID
WHERE EXTRACT(YEAR FROM T.TripDate) = &givenYear
GROUP BY S.SoldierID, S.Name_
ORDER BY TripCount DESC;

/* find trips by soldier name*/
SELECT T.TripID, T.TripDate, T.Destination
FROM Soldier S
JOIN HasTrips HT ON S.SoldierID = HT.SoldierID
JOIN Trip T ON HT.TripID = T.TripID
WHERE S.Name_ LIKE &SoldierName;


/*Retrieve all trips taken by soldiers from a specific base*/
SELECT B.BaseName, S.Name_, T.TripDate, T.Destination
FROM Base B
JOIN Vehicle V ON B.BaseID = V.BaseID
JOIN HadTrip HT ON V.VehicleID = HT.VehicleID
JOIN Trip T ON HT.TripID = T.TripID
JOIN DriveAt DA ON V.VehicleID = DA.VehicleID
JOIN Soldier S ON DA.SoldierID = S.SoldierID
WHERE B.BaseName = &BaseName;


-- Display all accidents with a damage level above a certain threshold
SELECT AccidentID, DateOfAccident, DamageLevel
FROM Accident
WHERE DamageLevel > &DamageLevelParameter;

