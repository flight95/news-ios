//
//  HomeItemView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.21
//

import Foundation
import SwiftUI
import Kingfisher
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import NewsView_Core
import NewsView_News

public struct HomeItemView : View {
    
    // MARK: - Instance functions.
    
    public init(
        columns: Int,
        news: NewsModel,
        onClick: @escaping (NewsModel) -> Void
    ) {
        _size = (columns == 1) ? 124 : 93
        _padding = (columns == 1) ? 2 : 1
        _news = news
        _opened = (news.openedAt ?? -1) > 0
        _onClick = onClick
    }
    
    // MARK: - Constants and Variables.
    
    private let _size: CGFloat
    private let _padding: CGFloat
    private let _news: NewsModel
    private let _opened: Bool
    private var _onClick: (NewsModel) -> Void
    
    // MARK: - Views.
    
    public var body: some View {
        NavigationLink(
            destination: NewsView(
                model: _news,
                onAppear: { news in _onClick(news) }
            )
        ) {
            HStack(alignment: .top) {
                ImageView.load(
                    source: _news.image,
                    width: _size,
                    height: _size
                ).background(.gray)
                    .cornerRadius(4)
                    .padding(.leading, 4)
                    .padding(.trailing, _padding)
                VStack(alignment: .leading) {
                    Text(_news.source)
                        .lineLimit(1)
                        .font(.caption)
                        .foregroundColor(.black)
                        .background(.white)
                        .padding(.top, _padding)
                    Text(_news.title)
                        .lineLimit(2)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(_opened ? .brown : .black)
                        .background(.white)
                        .padding(.top, 1)
                    Spacer(minLength: 4)
                    Text(TimeFormatter.string(from: _news.publishedAt) ?? "")
                        .lineLimit(1)
                        .font(.caption2)
                        .foregroundColor(.black)
                        .background(.white)
                        .padding(.bottom, 2)
                }
                .background(Color.white)
                .padding(.leading, 2)
                .padding(.trailing, 4)
                Spacer(minLength: 4)
            }
            .background(.white)
        }
        .background(.white)
        .cornerRadius(4)
        .padding(4)
    }
}
