//
//  HomeView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.18
//

import Foundation
import SwiftUI
import Combine
import PagingLibrary
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import NewsPresenter_Home

public struct HomeView<Presenter: HomePresenter>: View {
    
    // MARK: - Instance functions.
    
    public init(
        presenter: Presenter
    ) {
        _presenter = presenter
        _pageState = presenter.pageState
    }
    
    // MARK: - Constants and Variables.
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject private var _presenter: Presenter
    @ObservedObject private var _pageState: PageState<NewsModel>
    
    // MARK: - Views.
    
    public var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let columns = geometry.size.height > geometry.size.width ? 1 : 3
                ScrollView {
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible()), count: columns),
                        spacing: 0
                    ) {
                        ForEach(Array(_pageState.items.enumerated()), id: \.element.id) { index, news in
                            HomeItemView(
                                columns: columns,
                                news: news
                            )
                            .onAppear {
                                if (_pageState.items.count < index + 8) {
                                    _presenter.appendPager()
                                }
                            }
                        }
                        if (_pageState.paging) {
                            HomeItemProgressView().padding()
                        }
                        else if (_pageState.error != nil) { HomeItemErrorView(onRetry: { _presenter.retryPager() }).padding() }
                        else { }
                    }
                    .padding()
                }
            }
            .navigationTitle("Home")
            .onAppear { _presenter.initializePager() }
            .refreshable { _presenter.refreshPager() }
        }
        .navigationViewStyle(.stack)
    }
}
