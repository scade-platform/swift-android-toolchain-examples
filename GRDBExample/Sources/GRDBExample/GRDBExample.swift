// The Swift Programming Language
// https://docs.swift.org/swift-book

import GRDB


public struct Player: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var name: String
    var score: Int
}

public func testGRDB() throws -> [Player] {
    // 1. Open a database connection
    let dbQueue = try DatabaseQueue(path: "database.sqlite")

    // 2. Define the database schema
    try dbQueue.write { db in
        try db.create(table: "player") { t in
            t.primaryKey("id", .text)
            t.column("name", .text).notNull()
            t.column("score", .integer).notNull()
        }
    }

    // 4. Write and read in the database
    try dbQueue.write { db in
        try Player(id: "1", name: "Arthur", score: 100).insert(db)
        try Player(id: "2", name: "Barbara", score: 1000).insert(db)
    }

    let players: [Player] = try dbQueue.read { db in
        try Player.fetchAll(db)
    }

    return players
}
