//
//  HomePresenterModule.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

public struct HomePresenterModule {
    
    public static func provideHomePresenter() -> some HomePresenter {
        return HomePresenterImplements()
    }
}
