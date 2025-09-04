-- Run block to first drop all constraints, then remove all views and finally remove all tables
BEGIN
    FOR userConstraints IN (SELECT table_name, constraint_name FROM user_constraints) LOOP
        EXECUTE IMMEDIATE 'ALTER TABLE ' || userConstraints.table_name || ' DROP CONSTRAINT ' || userConstraints.constraint_name;
    END LOOP;

    FOR userViews IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || userViews.view_name;
    END LOOP;

    FOR userTables IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || userTables.table_name;
    END LOOP;
END;
