//
//  LimitOffsetPagingTests.swift
//  PagingKitTests
//
//  Created by Jakub Olejník on 08/01/2019.
//

import XCTest
import PagingKit

final class LimitOffsetPagingTests: XCTestCase {
    private var randomLimit: Int { return 10 + Int(arc4random_uniform(30)) }
    private var randomOffset: Int { return 50 + Int(arc4random_uniform(30)) }
    private var randomPaging: LimitOffsetPaging { return LimitOffsetPaging(limit: randomLimit, offset: randomOffset) }
    
    func testIsFirstPage() {
        let limit = randomLimit
        
        for offset in 0..<limit {
            let paging = LimitOffsetPaging(limit: limit, offset: offset)
            XCTAssertTrue(paging.isFirst)
        }
    }
    
    func testIsNotFirstPage() {
        let limit = randomLimit
        
        for offset in limit...randomOffset + limit {
            let paging = LimitOffsetPaging(limit: limit, offset: offset)
            XCTAssertFalse(paging.isFirst)
        }
    }
    
    func testHasCorrectPrevPage() {
        let paging = randomPaging
        
        XCTAssertEqual(paging.offset - paging.limit, paging.previous?.offset)
        XCTAssertEqual(paging.limit, paging.previous?.limit)
    }
    
    func testHasCorrectNextPage() {
        let paging = randomPaging
        
        XCTAssertEqual(paging.offset + paging.limit, paging.next?.offset)
        XCTAssertEqual(paging.limit, paging.next?.limit)
    }
}
