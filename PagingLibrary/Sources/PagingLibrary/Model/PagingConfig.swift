//
//  PagingConfig.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import Foundation

public class PagingConfig {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        initialKey: Int = 1,
        pageSize: Int = 16
    ) -> PagingConfig {
        return PagingConfig(
            initialKey: initialKey,
            pageSize: pageSize
        )
    }
    
    private init(
        initialKey: Int,
        pageSize: Int
    ) {
        self.initialKey = initialKey
        self.pageSize = pageSize
    }
    
    // MARK: - Constants and Variables.
    
    public let initialKey: Int
    public let pageSize: Int
}
