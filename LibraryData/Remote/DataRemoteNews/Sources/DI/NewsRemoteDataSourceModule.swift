//
//  NewsRemoteDataSourceModule.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import LibraryData_News
import LibraryData_Remote_Core

public struct NewsRemoteDataSourceModule {
    
    public static func provideNewsRemoteDataSource(
    ) -> some NewsRemoteDataSource {
        return NewsRemoteDataSourceImplements.getInstance(
            authentication: ApiAuthenticationModule.provideApiAuthentication(),
            api: NewsRemoteApiModule.provideNewsRemoteApi()
        )
    }
}
