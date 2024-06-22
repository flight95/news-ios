//
//  Number+Extensions.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

extension Int64 {
    
    public func aboveOrNil() -> Int64? {
        return self < 0 ? nil : self
    }
    
}

extension TimeInterval {
    
    public func aboveOrNil() -> TimeInterval? {
        return self < 0 ? nil : self
    }
}
