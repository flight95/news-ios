//
//  NewsPagingResponse+Mapper.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.21
//

import Foundation
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

extension NewsPagingResponse.NewsResponse {
    
    func toModel() -> NewsModel? {
        do {
            return try NewsModel(
                source: source?.name?.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News source could not be empty.") }(),
                title: title?.trimOrNil() ?? { throw RuntimeError.illegalState(message: "News title could not be empty.") }(),
                target: url?.toURL() ?? { throw RuntimeError.illegalState(message: "News target could not be empty.") }(),
                image: urlToImage?.toURL(),
                author: author?.trimOrNil(),
                description: description?.trimOrNil(),
                content: content?.trimOrNil(),
                publishedAt: UTCFormatter.time(from: publishedAt) ?? { throw RuntimeError.illegalState(message: "News published at could not be empty.") }(),
                openedAt: nil
            )
        } catch {
            return nil
        }
    }
}
