//
//  URLPagingTests.swift
//  PagingKitTests
//
//  Created by Jakub Olejník on 08/01/2019.
//

import XCTest
import PagingKit

final class URLPagingTests: XCTestCase {
    private var randomURL: URL {
        return URL(string: "https://google.com/" + String(arc4random()))!
    }
    
    func testIsFirstPage() {
        let paging = URLPaging(previous: nil, next: nil)
        XCTAssertTrue(paging.isFirst)
    }
    
    func testIsNotFirstPage() {
        let paging = URLPaging(previous: randomURL, next: nil)
        XCTAssertFalse(paging.isFirst)
    }
    
    func testHasCorrectPrevPage() {
        let previous = randomURL
        let next = randomURL
        
        let paging = URLPaging(previous: previous, next: next)
        
        XCTAssertEqual(previous, paging.previous)
    }
    
    func testHasCorrectNextPage() {
        let previous = randomURL
        let next = randomURL
        
        let paging = URLPaging(previous: previous, next: next)
        
        XCTAssertEqual(next, paging.next)
    }
}
