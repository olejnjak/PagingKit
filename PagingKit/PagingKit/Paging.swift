//
//  Paging.swift
//  PagingKit
//
//  Created by Jakub Olejník on 08/01/2019.
//

import Foundation

public protocol Paging {
    associatedtype PageType
    
    var previous: PageType? { get }
    var next: PageType? { get }
}

public extension Paging {
    public var isFirst: Bool {
        return previous == nil
    }
}
