//
//  NewsRemoteApi.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.20
//

import Foundation
import Combine
import Alamofire
import LibraryData_Remote_Core

public class NewsRemoteApi {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        server: ApiServer
    ) -> NewsRemoteApi {
        return NewsRemoteApi(
            server: server
        )
    }
    
    private init(
        server: ApiServer
    ) {
        _server = server
    }
    
    // MARK: - Constants and Variables.
    
    private var _server: ApiServer
    
    // MARK: - Implements GetNews.
    
    func get<R: NewsPagingResponse>(
        authorization: String,
        page: Int,
        size: Int
    ) -> AnyPublisher<R, some Error> {
        return ApiBuilder(server: _server)
            .request(
                method: .get,
                uri: "/v2/top-headlines?country=kr",
                parameters: [
                    "apiKey": authorization,
                    "page": page,
                    "pageSize": size
                ]
            )
    }
    
}
