//
//  Page.swift
//  PagingKit
//
//  Created by Jakub Olejník on 08/01/2019.
//

import Foundation

public struct Page<PagingType: Paging, ItemType> {
    public let paging: PagingType
    public let items: [ItemType]
    
    // MARK: - Initializers
    
    public init(paging: PagingType, items: [ItemType]) {
        self.paging = paging
        self.items = items
    }
    
    // MARK: - Static helpers
    
    public static func combine<PT: Paging, Result>(prevItems: [Result], new: Page<PT, Result>?) -> [Result] {
        if let new = new, new.paging.isFirst {
            return new.items
        } else {
            return prevItems + (new?.items ?? [])
        }
    }
    
    public static func+(lhs: [ItemType], rhs: Page<PagingType, ItemType>) -> [ItemType] {
        return combine(prevItems: lhs, new: rhs)
    }
}
