CREATE OR REPLACE PROCEDURE PromoteSoldiersFromCursor(p_SoldierIDs IN SYS_REFCURSOR)
IS
    v_SoldierID Soldier.SoldierID%TYPE;
    v_CurrentRank Soldier.Rank_%TYPE;
    v_NewRank Soldier.Rank_%TYPE;
BEGIN
    LOOP
        FETCH p_SoldierIDs INTO v_SoldierID;
        EXIT WHEN p_SoldierIDs%NOTFOUND;

        BEGIN
            -- Get the current rank of the soldier
            SELECT Rank_ INTO v_CurrentRank
            FROM Soldier
            WHERE SoldierID = v_SoldierID;

            -- Determine the new rank based on the current rank
            v_NewRank := CASE v_CurrentRank
                WHEN 'Private' THEN 'Corporal'
                WHEN 'Corporal' THEN 'Sergeant'
                WHEN 'Sergeant' THEN 'Lieutenant'
                WHEN 'Lieutenant' THEN 'Captain'
                ELSE v_CurrentRank -- If rank is Captain or any other, no promotion
            END;

            -- Update the rank of the soldier if there is a promotion
            IF v_NewRank != v_CurrentRank THEN
                UPDATE Soldier
                SET Rank_ = v_NewRank
                WHERE SoldierID = v_SoldierID;
            END IF;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Soldier with ID ' || v_SoldierID || ' not found.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error promoting soldier with ID ' || v_SoldierID || ': ' || SQLERRM);
        END;
    END LOOP;
    CLOSE p_SoldierIDs;
    COMMIT;
END;
