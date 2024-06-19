//
//  HomePresenterImplements.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryDomain_News

public class HomePresenterImplements : HomePresenter {
    
    // ****************************************************************************************************
    // MARK: Instance functions.
    
    public static func getInstance(
        getNews: GetNews
    ) -> HomePresenterImplements {
        return HomePresenterImplements(
            getNews: getNews
        )
    }
    
    private init(
        getNews: GetNews
    ) {
        self.getNews = getNews
    }
    
    deinit {
        cancellables.forEach { cancellable in cancellable.cancel() }
    }
    
    // ****************************************************************************************************
    // MARK: Constants and Variables.
    
    private var cancellables = Set<AnyCancellable>()
    
    private let getNews: GetNews
    
    // ****************************************************************************************************
    // MARK: Implements HomePresenter.
    
    @Published public var news: String = ""
    
    public func fetchNews() {
        getNews()
            .subscribe(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                        case .finished: break
                        case .failure(let error):
                            print("HomePresenterImplements.failure in \(Thread.current): \(error)")
                    }
                },
                receiveValue: { [weak self] value in
                    print("HomePresenterImplements.success in \(Thread.current)")
                    self?.news = value
                }
            )
            .store(in: &cancellables)
    }
}
