//
//  NewsRemoteApiModule.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import LibraryData_News
import LibraryData_Remote_Core

struct NewsRemoteApiModule {
    
    static func provideNewsRemoteApi() -> some NewsRemoteApi {
        return NewsRemoteApi.getInstance(
            server: ApiServerModule.provideApiServer()
        )
    }
}
