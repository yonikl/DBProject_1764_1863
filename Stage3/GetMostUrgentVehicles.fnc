CREATE OR REPLACE FUNCTION GetMostUrgentVehicles(p_N IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_Vehicles SYS_REFCURSOR;
BEGIN
    OPEN v_Vehicles FOR
        SELECT VehicleID, Model_, AquisitionDate, Status
        FROM Vehicle
        WHERE Status = 'Needs Maintenance'
        ORDER BY AquisitionDate ASC
        FETCH FIRST p_N ROWS ONLY;
    RETURN v_Vehicles;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        OPEN v_Vehicles FOR SELECT NULL AS VehicleID, NULL AS Model_, NULL AS AquisitionDate, NULL AS Status FROM DUAL WHERE 1 = 0; -- Empty cursor
        RETURN v_Vehicles;
END;
/
