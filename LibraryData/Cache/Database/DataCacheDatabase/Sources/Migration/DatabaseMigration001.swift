//
//  DatabaseMigration001.swift
//  LibraryData-Cache-Database
//
//  Created by Richard on 2024.06.22
//

import Foundation
import RealmSwift
import LibraryData_Cache_DatabaseNews

public struct DatabaseMigration001: DatabaseMigration {
    
    var objectTypes: [ObjectBase.Type] = [
        NewsEntity.self
    ]
    
    func migration(migration: Migration) {
    }
}
