//
//  NewsCacheDataSourceImplements.swift
//  LibraryData-Cache-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import RealmSwift
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import LibraryData_News
import LibraryData_Cache_Database

public class NewsCacheDataSourceImplements : NewsCacheDataSource {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        dao: NewsCacheDataAccessObject
    ) -> NewsCacheDataSourceImplements {
        return NewsCacheDataSourceImplements(
            dao: dao
        )
    }
    
    private init(
        dao: NewsCacheDataAccessObject
    ) {
        _dao = dao
    }
    
    // MARK: - Constants and Variables.
    
    private let _dao: NewsCacheDataAccessObject
    
    // MARK: - DispatchQueue.
    
    public func getQueue() -> DispatchQueue {
        return DispatchQueue(label: "database_queue", attributes: .concurrent)
    }
    
    // MARK: - Implements NewsCacheDataSource.
    
    public func set(
        model: NewsModel
    ) -> AnyPublisher<NewsModel?, Error> {
        return Future<NewsModel?, Error> { promise in
            self.getQueue().async {
                do {
                    let transaction = try Database.getTransaction()
                    try transaction.write {
                        if let entity = model.toEntity() {
                            self._dao.insert(transaction: transaction, entity: entity)
                            promise(.success(model))
                        } else {
                            promise(.success(nil))
                        }
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    public func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return Future<PagingModel<NewsModel>, Error> { promise in
            self.getQueue().async {
                do {
                    let transaction = try Database.getTransaction()
                    try transaction.write {
                        let entities = self._dao.select(transaction: transaction, offset: (page - 1) * size, limit: size)
                        let total = self._dao.count(transaction: transaction)
                        let paging = PagingModel(
                            total: total,
                            end: total <= (page * size),
                            contents: entities.compactMap { entity in entity.toModel() }
                        )
                        promise(.success(paging))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    public func add(
        paging: PagingModel<NewsModel>
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return Future<PagingModel<NewsModel>, Error> { promise in
            self.getQueue().async {
                do {
                    let transaction = try Database.getTransaction()
                    try transaction.write {
                        self._dao.insert(transaction: transaction, entities: paging.contents.compactMap { model in model.toEntity() })
                        promise(.success(paging))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    public func remove() -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            self.getQueue().async {
                do {
                    let transaction = try Database.getTransaction()
                    try transaction.write {
                        self._dao.delete(transaction: transaction)
                        promise(.success(true))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
