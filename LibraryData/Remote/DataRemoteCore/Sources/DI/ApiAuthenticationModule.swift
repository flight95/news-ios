//
//  ApiAuthenticationModule.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.20
//

public struct ApiAuthenticationModule {
    
    public static func provideApiAuthentication() -> String {
#if DEBUG
        return ApiAuthentication().release
#else
        return ApiAuthentication().release
#endif
    }
}
