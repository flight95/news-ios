//
//  NewsCacheDataSourceModule.swift
//  LibraryData-Cache-News
//
//  Created by Richard on 2024.06.23
//

import LibraryData_News

public struct NewsCacheDataSourceModule {
    
    public static func provideNewsCacheDataSource(
    ) throws -> some NewsCacheDataSource {
        return NewsCacheDataSourceImplements.getInstance(
            dao: NewsCacheDataAccessObject.getInstance()
        )
    }
}
