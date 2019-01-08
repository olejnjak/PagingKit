//
//  Paging.swift
//  PagingKit
//
//  Created by Jakub Olejník on 08/01/2019.
//

import Foundation

public protocol Paging {
    var previous: Self? { get }
    var next: Self? { get }
}

public extension Paging {
    public var isFirst: Bool {
        return previous == nil
    }
}
