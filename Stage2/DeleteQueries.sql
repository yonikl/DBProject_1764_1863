-- Delete all tripos that had no soldiers participate
DELETE FROM HadTrip
WHERE TripID IN (
    SELECT T.TripID
    FROM Trip T
    LEFT JOIN HasTrips HT ON T.TripID = HT.TripID
    WHERE HT.TripID IS NULL
);
DELETE FROM Trip
WHERE TripID NOT IN (SELECT TripID FROM HasTrips);



-- Delete all Out of Service vehicles
DELETE FROM DriveAt
WHERE VehicleID IN (
    SELECT VehicleID
    FROM Vehicle
    WHERE Status = 'Out of Service'
);

DELETE FROM HadTrip
WHERE VehicleID IN (
    SELECT VehicleID
    FROM Vehicle
    WHERE Status = 'Out of Service'
);

DELETE FROM HadAccident
WHERE VehicleID IN (
    SELECT VehicleID
    FROM Vehicle
    WHERE Status = 'Out of Service'
);

DELETE FROM MadeMaintenance
WHERE RecordID IN (
    SELECT MR.RecordID
    FROM MaintenanceRecord MR
    JOIN Vehicle V ON MR.VehicleID = V.VehicleID
    WHERE V.Status = 'Out of Service'
);

DELETE FROM MaintenanceRecord
WHERE VehicleID IN (
    SELECT VehicleID
    FROM Vehicle
    WHERE Status = 'Out of Service'
);
DELETE FROM Vehicle
WHERE Status = 'Out of Service';




