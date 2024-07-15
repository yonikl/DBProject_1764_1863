CREATE OR REPLACE PROCEDURE UpdateVehicleMaintenance(p_VehicleIDs IN SYS_REFCURSOR)
IS
    v_VehicleID Vehicle.VehicleID%TYPE;
    v_Model Vehicle.Model_%TYPE;
    v_AquisitionDate Vehicle.AquisitionDate%TYPE;
    v_Status Vehicle.Status%TYPE;
BEGIN
    LOOP
        FETCH p_VehicleIDs INTO v_VehicleID, v_Model, v_AquisitionDate, v_Status;
        EXIT WHEN p_VehicleIDs%NOTFOUND;

        -- Update the status of the vehicle to 'Maintenance Completed'
        UPDATE Vehicle
        SET Status = 'Maintenance Completed'
        WHERE VehicleID = v_VehicleID;

        -- Insert a maintenance record for the vehicle
        INSERT INTO MaintenanceRecord (RecordID, DateOfMaintenance, Description_, VehicleID)
        VALUES (SEQ_MaintenanceRecord.NEXTVAL, SYSDATE, 'Routine maintenance completed', v_VehicleID);

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
/
/
