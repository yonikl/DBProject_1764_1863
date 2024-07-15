DECLARE
    v_SoldierCursor SYS_REFCURSOR;
    v_Rank VARCHAR2(30) := 'Private'; -- Example rank
    v_N NUMBER := 3; -- Example number of soldiers
BEGIN
    -- Call the function to get the top N soldiers with the most trips of a specific rank
    v_SoldierCursor := GetTopNSoldiersWithMostTrips(v_Rank, v_N);

    -- Call the procedure to promote these soldiers
    PromoteSoldiersFromCursor(v_SoldierCursor);

    DBMS_OUTPUT.PUT_LINE('Promotion process completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred in the main program: ' || SQLERRM);
END;
