//
//  NewsRemoteDataSource.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.18
//

import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public protocol NewsRemoteDataSource {
    
    func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error>
}
