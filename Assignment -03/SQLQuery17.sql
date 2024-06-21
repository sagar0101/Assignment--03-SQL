-- Check if the login 'NewUser' exists
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'NewUser')
BEGIN
    -- Create a login for the user
    CREATE LOGIN NewUser WITH PASSWORD = 'YourPassword';

    -- Check if the user 'NewUser' exists in the current database
    IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'NewUser')
    BEGIN
        -- Create a user mapped to the login
        CREATE USER NewUser FOR LOGIN NewUser;

        -- Grant DB_owner permissions to the user
        ALTER ROLE db_owner ADD MEMBER NewUser;
    END
    ELSE
    BEGIN
        PRINT 'User NewUser already exists in the database.';
    END
END
ELSE
BEGIN
    PRINT 'Login NewUser already exists on the server.';
END
