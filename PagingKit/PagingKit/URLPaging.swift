//
//  URLPaging.swift
//  PagingKit
//
//  Created by Jakub Olejník on 08/01/2019.
//

import Foundation

public struct URLPaging: Paging {
    public let previous: URL?
    public let next: URL?
    
    // MARK: - Initializers
    
    public init(previous: URL?, next: URL?) {
        self.previous = previous
        self.next = previous
    }
}
