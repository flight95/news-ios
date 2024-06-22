//
//  NewsView.swift
//  NewsView-News
//
//  Created by Richard on 2024.06.23
//

import Foundation
import SwiftUI
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import NewsView_Core

public struct NewsView: View {
    
    // MARK: - Instance functions.
    
    public init(
        model: NewsModel,
        onAppear: @escaping (NewsModel) -> Void
    ) {
        _model = model
        _onAppear = onAppear
    }
    
    // MARK: - Constants and Variables.
    
    private var _model: NewsModel
    private var _onAppear: (NewsModel) -> Void
    
    // MARK: - Views.
    
    public var body: some View {
        GeometryReader { geometry in
            WebView(uri: _model.target)
                .padding()
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
        .navigationTitle("News")
        .onAppear { _onAppear(_model) }
    }
}
