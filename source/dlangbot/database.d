module dlangbot.database;

import ae.sys.database;
import ae.sys.file : ensurePathExists;

Database createDatabase(string databasePath)
{
    ensurePathExists(databasePath);
    return Database(databasePath, [
        // Define schema here.
        q"SQL
CREATE TABLE [Test] (
[ID] INTEGER PRIMARY KEY NOT NULL,
[Text] TEXT NOT NULL
);
SQL",
    ]);
}

Database db;

static this()
{
    // Create default database
    enum databasePath = "var/db.s3db";
    db = createDatabase(databasePath);
}
