CREATE OR REPLACE PROCEDURE UpdateVehicleMaintenance(p_VehicleIDs IN SYS_REFCURSOR)
IS
    v_VehicleID Vehicle.VehicleID%TYPE;
    v_Model Vehicle.Model_%TYPE;
    v_AquisitionDate Vehicle.AquisitionDate%TYPE;
    v_Status Vehicle.Status%TYPE;
    v_RecordID NUMBER;
BEGIN
    LOOP
        FETCH p_VehicleIDs INTO v_VehicleID, v_Model, v_AquisitionDate, v_Status;
        EXIT WHEN p_VehicleIDs%NOTFOUND;

        -- Generate a unique RecordID using SYSTIMESTAMP and VehicleID
        v_RecordID := TO_NUMBER(TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF')) + v_VehicleID;

        -- Update the status of the vehicle to 'Maintenance Completed'
        UPDATE Vehicle
        SET Status = 'Deployed'
        WHERE VehicleID = v_VehicleID;

        -- Insert a maintenance record for the vehicle
        INSERT INTO MaintenanceRecord (RecordID, DateOfMaintenance, Description_, VehicleID)
        VALUES (v_RecordID, SYSDATE, 'Routine maintenance completed', v_VehicleID);

        -- Print the maintenance update
        DBMS_OUTPUT.PUT_LINE('Vehicle ID: ' || v_VehicleID || ' | Status updated to Maintenance Completed.');
    END LOOP;
    CLOSE p_VehicleIDs;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating vehicle maintenance: ' || SQLERRM);
        ROLLBACK;
END;
