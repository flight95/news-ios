//
//  NewsRepositoryModule.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.19
//

import LibraryDomain_News

public struct NewsRepositoryModule {
    
    public static func provideNewsRepository(
        cache: NewsCacheDataSource,
        remote: NewsRemoteDataSource
    ) -> some NewsRepository {
        return NewsRepositoryImplements.getInstance(
            cache: cache,
            remote: remote
        )
    }
}
