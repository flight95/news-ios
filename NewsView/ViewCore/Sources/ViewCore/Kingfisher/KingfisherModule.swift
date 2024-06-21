//
//  KingfisherModule.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation
import Kingfisher

public struct KingfisherModule {
    
    public static func provideManager() -> KingfisherManager {
        let manager = KingfisherManager.shared
        manager.cache.diskStorage.config.sizeLimit = UInt.max
        manager.cache.memoryStorage.config.totalCostLimit = 0
        return manager
    }
}
