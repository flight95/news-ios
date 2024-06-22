//
//  NetworkError.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.24
//

import Foundation

public enum DatabaseError: Error {
    case initialize(message: String, cause: Error)
}
