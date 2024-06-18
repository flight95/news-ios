//
//  NewsApplication.swift
//  NewsApplication
//
//  Created by Richard on 2024.06.18
//

import SwiftUI
import NewsView_Home
import NewsPresenter_Home

@main
struct NewsApplication: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                presenter: HomePresenterModule.provideHomePresenter()
            )
        }
    }
}
