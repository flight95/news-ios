//
//  DatabaseMigration.swift
//  LibraryData-Cache-Database
//
//  Created by Richard on 2024.06.22
//

import Foundation
import RealmSwift

protocol DatabaseMigration {
    var objectTypes: [ObjectBase.Type] { get }
    func migration(migration: Migration)
}
