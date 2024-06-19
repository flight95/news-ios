//
//  GetNewsModule.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.19
//

public struct GetNewsModule {
    
    public static func provideGetNews(
        repository: NewsRepository
    ) -> some GetNews {
        return GetNewsImplements.getInstance(
            repository: repository
        )
    }
}
