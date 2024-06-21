//
//  PagingError.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import Foundation

public enum PagingError: Error {
    case appendError(cause: Error)
}
