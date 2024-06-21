//
//  ApiAuthentication.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.19
//

import Foundation

public struct ApiAuthentication {
    
    public let release: String = Bundle.main.object(forInfoDictionaryKey: "NewsApiKey") as? String ?? ""
}
