//
//  PageState.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import Foundation

public class PageState<T: Identifiable>: ObservableObject {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        key: Int? = nil
    ) -> PageState {
        return PageState(
            key: key
        )
    }
    
    private init(
        key: Int?
    ) {
        self.key = key
    }
    
    // MARK: - Constants and Variables.
    
    public var key: Int?
    public var finished: Bool = false
    @Published public var paging: Bool = false
    @Published public var error: PagingError? = nil
    
    // MARK: - Items.
    
    @Published public private(set) var items: [T] = []
    
    func append(items: [T]) {
        self.items.append(contentsOf: items)
    }
}
