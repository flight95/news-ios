//
//  ImageView.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation
import SwiftUI
import Kingfisher
import LibraryDomain_Model_Core

public class ImageView {
    
    public static func load(
        source: URL?,
        width: CGFloat,
        height: CGFloat
    ) -> some View {
        return KFImage(source?.fixHTTP())
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
