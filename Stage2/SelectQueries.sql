
/*List all vehicles that have never been in an accident*/
SELECT V.VehicleID, V.Model_
FROM Vehicle V
LEFT JOIN HadAccident HA ON V.VehicleID = HA.VehicleID
WHERE HA.AccidentID IS NULL;

/*Show maintenance history for vehicles older than 5 years*/
SELECT V.VehicleID, V.Model_, MR.DateOfMaintenance, MR.Description_
FROM Vehicle V
JOIN MaintenanceRecord MR ON V.VehicleID = MR.VehicleID
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM V.AquisitionDate) > 5
ORDER BY MR.DateOfMaintenance;

/*SELECT query that will identify the name and ID of the soldiers who has been involved in more then 5 accidents. */
SELECT S.SoldierID, S.Name_, COUNT(A.AccidentID) AS NumberOfAccidents
FROM Soldier S
JOIN DriveAt DA ON S.SoldierID = DA.SoldierID
JOIN HadAccident HA ON DA.VehicleID = HA.VehicleID
JOIN Accident A ON HA.AccidentID = A.AccidentID
GROUP BY S.SoldierID, S.Name_
HAVING COUNT(A.AccidentID) > 5
ORDER BY NumberOfAccidents DESC;

/* soldiers who have been on 4 or more trips.*/
SELECT S.SoldierID, S.Name_, COUNT(HT.TripID) AS NumberOfTrips
FROM Soldier S
JOIN HasTrips HT ON S.SoldierID = HT.SoldierID
JOIN Trip T ON HT.TripID = T.TripID
GROUP BY S.SoldierID, S.Name_
HAVING COUNT(HT.TripID) >= 4
ORDER BY NumberOfTrips DESC;

