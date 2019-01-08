//
//  LimitOffsetPaging.swift
//  PagingKit
//
//  Created by Jakub Olejník on 08/01/2019.
//

import Foundation

public struct LimitOffsetPaging: Paging {
    public let limit: Int
    public let offset: Int
    
    public var previous: LimitOffsetPaging? {
        guard offset >= limit else { return nil }
        return LimitOffsetPaging(limit: limit, offset: offset - limit)
    }
    
    public var next: LimitOffsetPaging? {
        return LimitOffsetPaging(limit: limit, offset: offset + limit)
    }
    
    // MARK: - Initializers
    
    public init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
}
