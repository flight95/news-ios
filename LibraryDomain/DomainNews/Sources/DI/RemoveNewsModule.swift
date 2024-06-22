//
//  RemoveNewsModule.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.23
//

public struct RemoveNewsModule {
    
    public static func provideRemoveNews(
        repository: NewsRepository
    ) -> some RemoveNews {
        return RemoveNewsImplements.getInstance(
            repository: repository
        )
    }
}
