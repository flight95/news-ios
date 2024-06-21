//
//  RuntimeError.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

public enum RuntimeError: Error {
    case illegalState(message: String)
}
