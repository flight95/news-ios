//
//  DatabaseModule.swift
//  LibraryData-Cache-Database
//
//  Created by Richard on 2024.06.22
//

import Foundation
import Realm
import RealmSwift
import LibraryDomain_Model_Core

public struct DatabaseModule {
    
    private static let version: Int = 1
    
    private static let migrations: [DatabaseMigration] = [
        DatabaseMigration001()
    ]
    
    public static func provideConfiguration() -> Realm.Configuration {
        let identifier = "richard_library_data_cache_database.realm"
        var objectTypes: [ObjectBase.Type] = []
        let configuration = Realm.Configuration(
            fileURL: URL(fileURLWithPath: RLMRealmPathForFile(identifier), isDirectory: false),
            inMemoryIdentifier: identifier,
            readOnly: false,
            schemaVersion: UInt64(version),
            migrationBlock: { migration, oldSchemaVersion in
                migrations.prefix(version)
                    .forEach { migrator in
                        migrator.migration(migration: migration)
                        objectTypes.append(contentsOf: migrator.objectTypes)
                    }
            },
            deleteRealmIfMigrationNeeded: false,
            objectTypes: objectTypes
        )
        return configuration
    }
}
