//
//  NewsModel.swift
//  LibraryDomain-Model-News
//
//  Created by Richard on 2024.06.20
//

import Foundation
import LibraryDomain_Model_Core

public struct NewsModel: Identifiable {
    
    public let source: String
    public let title: String
    public let target: URL
    public let image: URL?
    public let author: String?
    public let description: String?
    public let content: String?
    public let publishedAt: TimeInterval
    public let openedAt: TimeInterval?
    public let id: String
    
    public init(
        source: String,
        title: String,
        target: URL,
        image: URL?,
        author: String?,
        description: String?,
        content: String?,
        publishedAt: TimeInterval,
        openedAt: TimeInterval?
    ) throws {
        if let data = "\(source)\(title)\(target)\(publishedAt)".data(using: .utf8) {
            self.id = data.base64EncodedString()
        } else {
            throw RuntimeError.illegalState(message: "Base64 encoding for id generation failed.")
        }
        
        self.source = source
        self.title = title
        self.target = target
        self.image = image
        self.author = author
        self.description = description
        self.content = content
        self.publishedAt = publishedAt
        self.openedAt = openedAt
    }
}
