//
//  HomePresenterModule.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import LibraryDomain_News
import LibraryData_News
import LibraryData_Remote_News

public struct HomePresenterModule {
    
    public static func provideHomePresenter() -> some HomePresenter {
        return HomePresenterImplements.getInstance(
            getNews: GetNewsModule.provideGetNews(
                repository: NewsRepositoryModule.provideNewsRepository(
                    remote: NewsRemoteDataSourceModule.provideNewsRemoteDataSource()
                )
            )
        )
    }
}
