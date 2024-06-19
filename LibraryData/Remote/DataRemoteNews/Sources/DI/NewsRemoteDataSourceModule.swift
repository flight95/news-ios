//
//  NewsRemoteDataSourceModule.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import LibraryData_News

public struct NewsRemoteDataSourceModule {
    
    public static func provideNewsRemoteDataSource() -> some NewsRemoteDataSource {
        return NewsRemoteDataSourceImplements.getInstance()
    }
}
