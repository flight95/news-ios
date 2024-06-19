//
//  HomeView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.18
//

import SwiftUI
import NewsPresenter_Home

public struct HomeView<Presenter: HomePresenter>: View {
    
    public init(
        presenter: Presenter
    ) {
        self.presenter = presenter
    }
    
    @ObservedObject var presenter: Presenter
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button(
                action: { presenter.fetchNews() }
            ) {
                Text("CLICK: \(presenter.news)")
            }
        }
        .padding()
    }
}

#Preview {
    HomeView(
        presenter: HomePresenterModule.provideHomePresenter()
    )
}
