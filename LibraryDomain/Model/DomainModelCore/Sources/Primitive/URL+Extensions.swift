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
    
    public func fixHTTP() -> String {
        if (hasPrefix("http://")) {
            return "https://\(dropFirst(7))"
        } else {
            return self
        }
    }
}

extension URL {
    
    public func fixHTTP() -> URL {
        switch scheme {
            case "http":
                return URL(string: "https://\(absoluteString.dropFirst(7))")!
            default:
                return self
        }
    }
}
