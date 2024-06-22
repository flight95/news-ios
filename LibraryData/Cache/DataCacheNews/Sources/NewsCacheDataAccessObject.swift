//
//  NewsCacheDataAccessObject.swift
//  LibraryData-Cache-News
//
//  Created by Richard on 2024.06.19
//

import RealmSwift
import LibraryData_Cache_Database
import LibraryData_Cache_DatabaseNews

public class NewsCacheDataAccessObject {
    
    // MARK: - Instance functions.
    
    public static func getInstance() -> NewsCacheDataAccessObject {
        return NewsCacheDataAccessObject()
    }
    
    private init() { }
    
    // MARK: - Queries.
    
    func count(
        transaction: Realm
    ) -> Int64 {
        return Int64(transaction.objects(NewsEntity.self).count)
    }
    
    func select(
        transaction: Realm,
        offset: Int,
        limit: Int
    ) -> [NewsEntity] {
        return Array(
            transaction
                .objects(NewsEntity.self)
                .sorted(byKeyPath: "newsPublishedAt", ascending: false)
                .dropFirst(offset)
                .prefix(limit)
        )
    }
    
    func insert(
        transaction: Realm,
        entity: NewsEntity
    ) {
        transaction.add(entity, update: .modified)
    }
    
    func insert(
        transaction: Realm,
        entities: [NewsEntity]
    ) {
        transaction.add(entities, update: .error)
    }
    
    func delete(
        transaction: Realm
    ) {
        transaction.delete(transaction.objects(NewsEntity.self))
    }
}
