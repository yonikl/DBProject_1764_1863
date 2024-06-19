/*Promote soldiers who have been on more than 4 trips */
UPDATE Soldier
SET Rank_ = 'Sergeant'
WHERE SoldierID IN (
    SELECT SoldierID
    FROM HasTrips
    GROUP BY SoldierID
    HAVING COUNT(*) > 4
);

SELECT * FROM Soldier;

-- Change the status of vehicles involved in severe accidents to Under review
UPDATE Vehicle
SET Status = 'Under Review'
WHERE VehicleID IN (
    SELECT HA.VehicleID
    FROM HadAccident HA
    JOIN Accident A ON HA.AccidentID = A.AccidentID
    WHERE A.DamageLevel > 7
);

SELECT * FROM Vehicle;

