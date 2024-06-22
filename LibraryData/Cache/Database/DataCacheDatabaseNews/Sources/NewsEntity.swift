//
//  NewsEntity.swift
//  LibraryData-Cache-DatabaseNews
//
//  Created by Richard on 2024.06.22
//

import Foundation
import RealmSwift

public class NewsEntity: Object {
    
    @Persisted(primaryKey: true) public var newsId: String = ""
    @Persisted public var newsSource: String = ""
    @Persisted public var newsTitle: String = ""
    @Persisted public var newsTarget: String = ""
    @Persisted public var newsImage: String = ""
    @Persisted public var newsAuthor: String = ""
    @Persisted public var newsDescription: String = ""
    @Persisted public var newsContent: String = ""
    @Persisted public var newsPublishedAt: TimeInterval = -1
    @Persisted public var newsOpenedAt: TimeInterval = -1
    
    public override init() {
        super.init()
    }
    
    public init(
        newsId: String,
        newsSource: String,
        newsTitle: String,
        newsTarget: String,
        newsImage: String,
        newsAuthor: String,
        newsDescription: String,
        newsContent: String,
        newsPublishedAt: TimeInterval,
        newsOpenedAt: TimeInterval
    ) {
        self.newsId = newsId
        self.newsSource = newsSource
        self.newsTitle = newsTitle
        self.newsTarget = newsTarget
        self.newsImage = newsImage
        self.newsAuthor = newsAuthor
        self.newsDescription = newsDescription
        self.newsContent = newsContent
        self.newsPublishedAt = newsPublishedAt
        self.newsOpenedAt = newsOpenedAt
    }
}
