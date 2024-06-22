//
//  WebView.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.23
//

import Foundation
import SwiftUI
import WebKit
import LibraryDomain_Model_Core

public struct WebView: UIViewRepresentable {
    
    public init(uri: URL) {
        _uri = uri
    }
    
    private let _uri: URL
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: _uri.fixHTTP())
        uiView.load(request)
    }
}
