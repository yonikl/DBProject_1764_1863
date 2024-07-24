-- This view provides detailed information on assignments, 
-- including associated equipment and operations details.
CREATE VIEW Assignments_View AS
SELECT 
    a.A_id,
    a.E_id,
    a.Start_date,
    a.End_date,
    e.E_id AS EquipmentID,
    e.Type_,
    e.Status,
    o.O_id,
    o.O_name,
    o.Objective
FROM 
    Assignments a
LEFT JOIN 
    Equipment e ON a.E_id = e.E_id
LEFT JOIN 
    Assigned_operation ao ON a.A_id = ao.A_id
LEFT JOIN 
    Operations_ o ON ao.O_id = o.O_id;


-- This view provides detailed information on vehicles,
-- including their maintenance records.
CREATE VIEW Vehicle_View AS
SELECT 
    v.VehicleID,
    v.Model_,
    v.AquisitionDate,
    v.Status,
    m.RecordID,
    m.DateOfMaintenance,
    m.Description_
FROM 
    Vehicle v
JOIN 
    MaintenanceRecord m ON v.VehicleID = m.VehicleID;
    
    
----------------------------------------------


-- This query counts the number of assignments for each piece of equipment.
SELECT 
    EquipmentID, 
    Type_, 
    COUNT(A_id) AS assignment_count
FROM 
    Assignments_View
GROUP BY 
    EquipmentID, 
    Type_;

-- This query retrieves all assignments along with their duration in days.
SELECT 
    A_id, 
    E_id, 
    Start_date, 
    End_date, 
    EquipmentID, 
    Type_, 
    Status, 
    O_id, 
    O_name, 
    Objective,
    (End_date - Start_date) AS duration_days
FROM 
    Assignments_View;

-- This query counts the number of maintenance records for each vehicle.
SELECT 
    VehicleID, 
    Model_, 
    COUNT(RecordID) AS maintenance_count
FROM 
    Vehicle_View
GROUP BY 
    VehicleID, 
    Model_;

-- This query calculates the age of each vehicle in years.
SELECT 
    VehicleID, 
    Model_, 
    AquisitionDate, 
    ROUND(MONTHS_BETWEEN(SYSDATE, AquisitionDate) / 12, 2) AS vehicle_age_years
FROM 
    Vehicle_View;

