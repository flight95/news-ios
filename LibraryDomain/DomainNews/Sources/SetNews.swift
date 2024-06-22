//
//  SetNews.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.23
//

import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public protocol SetNews {
    
    func callAsFunction(
        model: NewsModel
    ) -> AnyPublisher<NewsModel?, Error>
}
