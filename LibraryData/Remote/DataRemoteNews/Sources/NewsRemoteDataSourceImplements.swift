//
//  NewsRemoteDataSourceImplements.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryData_News

public class NewsRemoteDataSourceImplements : NewsRemoteDataSource {
    
    // ****************************************************************************************************
    // MARK: Instance functions.
    
    public static func getInstance() -> NewsRemoteDataSourceImplements {
        return NewsRemoteDataSourceImplements()
    }
    
    private init() { }
    
    // ****************************************************************************************************
    // MARK: Implements GetNews.
    
    public func get() -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            DispatchQueue.global(qos: .default).async {
                do {
                    print("NewsRemoteDataSourceImplements.success in \(Thread.current)")
                    promise(.success("NewsRemoteDataSourceImplements"))
                } catch {
                    print("NewsRemoteDataSourceImplements.failure in \(Thread.current)")
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
