//
//  SetNewsModule.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.23
//

public struct SetNewsModule {
    
    public static func provideSetNews(
        repository: NewsRepository
    ) -> some SetNews {
        return SetNewsImplements.getInstance(
            repository: repository
        )
    }
}
