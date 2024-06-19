//
//  GetNews.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.18
//

import Combine

public protocol GetNews {
    
    func callAsFunction() -> AnyPublisher<String, Error>
}
