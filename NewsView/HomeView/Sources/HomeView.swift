//
//  HomeView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.18
//

import SwiftUI
import NewsPresenter_Home

public struct HomeView<Presenter: HomePresenter>: View {
    
    // MARK: - Instance functions.
    
    public init(
        presenter: Presenter
    ) {
        _presenter = presenter
    }
    
    // MARK: - Constants and Variables.
    
    @ObservedObject private var _presenter: Presenter
    
    // MARK: - Views.
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button(
                action: { _presenter.fetchNews() }
            ) {
                Text("CLICK: \(_presenter.news)")
            }
        }
        .padding()
    }
}

// MARK: - Preview.

#Preview {
    HomeView(
        presenter: HomePresenterModule.provideHomePresenter()
    )
}
