//
//  URL+Extensions.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

extension String {
    
    public func toURL() -> URL? {
        return URL(string: self)
    }
}
