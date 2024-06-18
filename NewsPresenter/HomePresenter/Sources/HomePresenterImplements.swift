//
//  HomePresenterImplements.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import Foundation

public class HomePresenterImplements : HomePresenter {
    
    @Published public var count: Int = 0
    
    public func addCount() {
        count += 1
    }
}
