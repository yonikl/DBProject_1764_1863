CREATE OR REPLACE FUNCTION GetTopNSoldiersWithMostTrips(p_Rank IN VARCHAR2, p_N IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_Soldiers SYS_REFCURSOR;
BEGIN
    OPEN v_Soldiers FOR
        SELECT s.SoldierID
        FROM Soldier s
        JOIN HasTrips ht ON s.SoldierID = ht.SoldierID
        WHERE s.Rank_ = p_Rank
        GROUP BY s.SoldierID
        ORDER BY COUNT(ht.TripID) DESC
        FETCH FIRST p_N ROWS ONLY;
    RETURN v_Soldiers;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        OPEN v_Soldiers FOR SELECT NULL AS SoldierID FROM DUAL WHERE 1 = 0; -- Empty cursor
        RETURN v_Soldiers;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        OPEN v_Soldiers FOR SELECT NULL AS SoldierID FROM DUAL WHERE 1 = 0; -- Empty cursor
        RETURN v_Soldiers;
END;
/
