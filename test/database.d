import std.file;

import utils;

import dlangbot.database;

@("database")
unittest
{
    // Create a temporary database for this unit test only
    enum databasePath = "var/db-test-database.s3db";
    db = createDatabase(databasePath);
    scope(exit) remove(databasePath);

    db.stmt!"INSERT INTO [Test] ([Text]) VALUES (?)".exec("Hello, world!");

    string text;
    foreach (string _text; db.stmt!"SELECT [Text] FROM [Test] WHERE [Text] LIKE ?".iterate("Hello%"))
        text = _text;
    assert(text == "Hello, world!");
}
