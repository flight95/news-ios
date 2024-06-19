//
//  NewsRepositoryModule.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.19
//

import LibraryDomain_News

public struct NewsRepositoryModule {
    
    public static func provideNewsRepository(
        remote: NewsRemoteDataSource
    ) -> some NewsRepository {
        return NewsRepositoryImplements.getInstance(
            remote: remote
        )
    }
}
