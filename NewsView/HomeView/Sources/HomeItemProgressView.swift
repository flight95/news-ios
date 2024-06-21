//
//  HomeItemProgressView.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.22
//

import Foundation
import SwiftUI
import NewsView_Core

public struct HomeItemProgressView : View {
    
    // MARK: - Instance functions.
    
    public init() { }
    
    // MARK: - Views.
    
    public var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .padding(16)
        }
        .background(.white)
        .frame(minHeight: 64)
    }
}

// MARK: - Previews.

struct HomeItemProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemProgressView()
    }
}
