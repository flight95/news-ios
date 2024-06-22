//
//  HomePresenterModule.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import LibraryDomain_News
import LibraryData_News
import LibraryData_Cache_News
import LibraryData_Remote_News

public struct HomePresenterModule {
    
    public static func provideHomePresenter() throws -> some HomePresenter {
        let repository = NewsRepositoryModule.provideNewsRepository(
            cache: try NewsCacheDataSourceModule.provideNewsCacheDataSource(),
            remote: NewsRemoteDataSourceModule.provideNewsRemoteDataSource()
        )
        return HomePresenterImplements.getInstance(
            setNews: SetNewsModule.provideSetNews(repository: repository),
            getNews: GetNewsModule.provideGetNews(repository: repository),
            removeNews: RemoveNewsModule.provideRemoveNews(repository: repository)
        )
    }
}
