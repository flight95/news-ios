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
import LibraryData_Cache_Database

@main
struct NewsApplication: App {
    
    // MARK: - Instance functions.
    
    init() {
        initializeDatabaseLibrary()
        initializeImageLibrary()
    }
    
    // MARK: - Views.
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                presenter: try! HomePresenterModule.provideHomePresenter()
            )
        }
    }
    
    // MARK: - Database library.
    
    private func initializeDatabaseLibrary() {
        let _ = DatabaseModule.provideConfiguration()
    }
    
    // MARK: - Image library.
    
    private func initializeImageLibrary() {
        let _ = KingfisherModule.provideManager()
    }
}
