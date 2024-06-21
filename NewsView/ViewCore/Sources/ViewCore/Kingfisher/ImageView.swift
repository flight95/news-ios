//
//  ImageView.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation
import SwiftUI
import Kingfisher

public class ImageView {
    
    public static func load(
        source: URL?,
        width: CGFloat,
        height: CGFloat
    ) -> some View {
        return KFImage(source)
            .setProcessor(
                ResizingImageProcessor(
                    referenceSize: CGSize(width: width, height: width),
                    mode: .aspectFill
                )
            ).cancelOnDisappear(false)
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
    }
}
