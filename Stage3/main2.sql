DECLARE
    v_VehicleCursor SYS_REFCURSOR;
    v_N NUMBER := 3; -- Example number of most urgent vehicles
BEGIN
    -- Call the function to get the N most urgent vehicles that need maintenance
    v_VehicleCursor := GetMostUrgentVehicles(v_N);

    -- Call the procedure to update the vehicle maintenance status and insert maintenance records
    UpdateVehicleMaintenance(v_VehicleCursor);

    DBMS_OUTPUT.PUT_LINE('Maintenance update process completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred in the main program: ' || SQLERRM);
END;
