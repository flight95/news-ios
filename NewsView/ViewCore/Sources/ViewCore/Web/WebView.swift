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
    
    public init(
        uri: URL,
        onStart: @escaping () -> Void,
        onEnd: @escaping () -> Void,
        onError: @escaping (any Error) -> Void
    ) {
        _uri = uri
        _onStart = onStart
        _onEnd = onEnd
        _onError = onError
    }
    
    private let _uri: URL
    private let _onStart: () -> Void
    private let _onEnd: () -> Void
    private let _onError: (any Error) -> Void
    
    // MARK: - UIViewRepresentable.
    
    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        setConfiguration(context: context, webView: webView)
        return webView
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(
            url: _uri.fixHTTP(),
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 8
        )
        uiView.load(request)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            parent: self,
            onStart: _onStart,
            onEnd: _onEnd,
            onError: _onError
        )
    }
    
    // MARK: - UIViewRepresentable.
    
    private func setConfiguration(context: Context, webView: WKWebView) {
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = false
        
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        webView.configuration.defaultWebpagePreferences = preference
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.dataDetectorTypes = [.link, .calendarEvent, .address, .phoneNumber]
    }
    
    // MARK: - WKNavigationDelegate.
    
    public class Coordinator : NSObject, WKNavigationDelegate {
        
        init(
            parent: WebView,
            onStart: @escaping () -> Void,
            onEnd: @escaping () -> Void,
            onError: @escaping (any Error) -> Void
        ) {
            _parent = parent
            _onStart = onStart
            _onEnd = onEnd
            _onError = onError
        }
        
        private let _parent: WebView
        private let _onStart: () -> Void
        private let _onEnd: () -> Void
        private let _onError: (any Error) -> Void
        
        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) { }
        
        public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: any Error) {
            _onEnd()
            _onError(error)
        }
        
        public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            guard let response = navigationResponse.response as? HTTPURLResponse,
                  let url = response.url,
                  url.scheme == "http" else {
                return decisionHandler(.allow)
            }
            
            // http process.
            if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                components.scheme = "https"
                if let httpsURL = components.url {
                    let newRequest = URLRequest(url: httpsURL)
                    webView.load(newRequest)
                }
            }
            return decisionHandler(.cancel)
        }
        
        public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            _onEnd()
        }
        
        public func webView(_ webView: WKWebView, didFail navigation: WKNavigation?, withError error: Error) {
            _onEnd()
            _onError(error)
        }
        
        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation?) {
            _onEnd()
        }
        
        public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
            _onEnd()
            _onError(DataError.illegalState(message: "Web content process did terminate in WebView."))
        }
    }
}
