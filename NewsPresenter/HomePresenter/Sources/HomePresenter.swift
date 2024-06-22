//
//  HomePresenter.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import Combine
import PagingLibrary
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public protocol HomePresenter: ObservableObject {
    
    var pageState: PageState<NewsModel> { get }
    
    func initializePager()
    func appendPager()
    func retryPager()
    func refreshPager()
    
    func selectNews(news: NewsModel)
}
