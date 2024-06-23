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
    @State private var _loading: Bool = true
    
    // MARK: - Views.
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                WebView(
                    uri: _model.target,
                    onStart: { self._loading = true },
                    onEnd: { self._loading = false },
                    onError: { error in self._loading = false }
                ).background(.white)
                if (_loading) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(2)
                }
            }.frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
        }
        .navigationTitle("News")
        .onAppear { _onAppear(_model) }
    }
}
