//
//  ApiServerModule.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.20
//

public struct ApiServerModule {
    
    public static func provideApiServer() -> ApiServer {
#if DEBUG
        return ApiServer.release
#else
        return ApiServer.release
#endif
    }
}
