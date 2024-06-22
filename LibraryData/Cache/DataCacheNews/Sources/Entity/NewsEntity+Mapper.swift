//
//  NewsEntity+Mapper.swift
//  LibraryData-Cache-News
//
//  Created by Richard on 2024.06.23
//

import Foundation
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import LibraryData_Cache_DatabaseNews

extension NewsEntity {
    
    func toModel() -> NewsModel? {
        do {
            return try NewsModel(
                source: newsSource.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News source could not be empty.") }(),
                title: newsTitle.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News title could not be empty.") }(),
                target: newsTarget.toURL() ?? { throw RuntimeError.illegalState(message: "News target could not be empty.") }(),
                image: newsImage.toURL(),
                author: newsAuthor.trimOrNil(),
                description: newsDescription.trimOrNil(),
                content: newsContent.trimOrNil(),
                publishedAt: newsPublishedAt.aboveOrNil() ?? { throw RuntimeError.illegalState(message: "News published at could not be empty.") }(),
                openedAt: nil
            )
        } catch {
            return nil
        }
    }
}

extension NewsModel {
    
    func toEntity() -> NewsEntity? {
        do {
            return try NewsEntity(
                newsId: id.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News id could not be empty.") }(),
                newsSource: source.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News source could not be empty.") }(),
                newsTitle: title.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News title could not be empty.") }(),
                newsTarget: target.absoluteString,
                newsImage: image?.absoluteString ?? "",
                newsAuthor: author?.trimOrNil() ?? "",
                newsDescription: description?.trimOrNil() ?? "",
                newsContent: content?.trimOrNil() ?? "",
                newsPublishedAt: publishedAt.aboveOrNil() ?? { throw RuntimeError.illegalState(message: "News published at could not be empty.") }(),
                newsOpenedAt: openedAt?.aboveOrNil() ?? -1
            )
        } catch {
            return nil
        }
    }
}
