//
//  String+Extensions.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

extension String {
    
    public func trimOrNil() -> String? {
        let fixed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return fixed.isEmpty ? nil : fixed
    }
}

