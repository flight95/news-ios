//
//  NetworkError.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

public enum NetworkError: Error {
    case timeout(code: Int, message: String)
    case http(code: Int, message: String)
    case serialization(code: Int, message: String)
    case unknown(code: Int, message: String)
}
