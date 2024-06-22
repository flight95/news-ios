//
//  HomeItemErrorView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.22
//

import Foundation
import SwiftUI
import NewsView_Core

public struct HomeItemErrorView : View {
    
    // MARK: - Instance functions.
    
    public init(
        onRetry: @escaping () -> Void
    ) {
        _onRetry = onRetry
    }
    
    // MARK: - Constants and Variables.
    
    private var _onRetry: () -> Void
    
    // MARK: - Views.
    
    public var body: some View {
        VStack {
            Button(
                action: { _onRetry() },
                label: {
                    Text("Retry".uppercased())
                        .foregroundColor(.white)
                        .padding(16)
                }
            )
            .background(.black)
            .cornerRadius(8)
        }
        .frame(minHeight: 64)
    }
}

// MARK: - Previews.

struct HomeItemErrorView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemProgressView()
    }
}

