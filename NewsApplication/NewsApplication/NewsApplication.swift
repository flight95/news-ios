//
//  NewsApplication.swift
//  NewsApplication
//
//  Created by Richard on 2024.06.18
//

import SwiftUI
import NewsView_Core
import NewsView_Home
import NewsPresenter_Home

@main
struct NewsApplication: App {
    
    private let manager = KingfisherModule.provideManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                presenter: HomePresenterModule.provideHomePresenter()
            )
        }
    }
}
