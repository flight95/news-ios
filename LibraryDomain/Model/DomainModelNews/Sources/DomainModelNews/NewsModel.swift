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
    
    public func copy(
        source: String? = nil,
        title: String? = nil,
        target: URL? = nil,
        image: URL? = nil,
        author: String? = nil,
        description: String? = nil,
        content: String? = nil,
        publishedAt: TimeInterval? = nil,
        openedAt: TimeInterval? = nil
    ) throws -> NewsModel {
        return try NewsModel(
            source: source ?? self.source,
            title: title ?? self.title,
            target: target ?? self.target,
            image: image ?? self.image,
            author: author ?? self.author,
            description: description ?? self.description,
            content: content ?? self.content,
            publishedAt: publishedAt ?? self.publishedAt,
            openedAt: openedAt ?? self.openedAt
        )
    }
}
