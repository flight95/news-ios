//
//  Database.swift
//  LibraryData-Cache-Database
//
//  Created by Richard on 2024.06.22
//

import Foundation
import RealmSwift
import LibraryDomain_Model_Core

public class Database {
    
    // MARK: - Instance functions.
    
    public static func getTransaction() throws -> Realm {
        do {
            return try Realm()
        } catch {
            throw DatabaseError.initialize(message: "Could not initialize Realm instance.", cause: error)
        }
    }
}
