//
//  HomePresenter.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import Combine

public protocol HomePresenter: ObservableObject {
    
    var count: Int { get }
    
    func addCount()
}
