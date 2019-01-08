//
//  PageTests.swift
//  PagingKitTests
//
//  Created by Jakub Olejník on 08/01/2019.
//

import XCTest
import PagingKit

private typealias PageType = Page<LimitOffsetPaging, Int>

final class PageTests: XCTestCase {
    private var randomLimit: Int { return 10 + Int(arc4random_uniform(30)) }
    private var randomOffset: Int { return 50 + Int(arc4random_uniform(30)) }
    
    func testFirstPageCombine() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = PageType(paging: paging, items: items)
        
        XCTAssertEqual(PageType.combine(prevItems: [Int](), new: firstPage), items)
    }
    
    func testFirstPageOptionalCombine() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = Optional(PageType(paging: paging, items: items))
        
        XCTAssertEqual(PageType.combine(prevItems: [Int](), new: firstPage), items)
    }
    
    func testFirstPagePlus() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = PageType(paging: paging, items: items)
        
        XCTAssertEqual([] + firstPage, items)
    }
    
    func testRefreshCombine() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = PageType(paging: paging, items: items)
        let prevItems = [1, 2, 3]
        
        XCTAssertEqual(PageType.combine(prevItems: prevItems, new: firstPage), items)
    }
    
    func testRefreshOptionalCombine() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = Optional(PageType(paging: paging, items: items))
        let prevItems = [1, 2, 3]
        
        XCTAssertEqual(PageType.combine(prevItems: prevItems, new: firstPage), items)
    }
    
    func testRefreshPlus() {
        let paging = LimitOffsetPaging(limit: randomLimit, offset: 0)
        let items = (0..<paging.limit).map { $0 }
        let firstPage = PageType(paging: paging, items: items)
        let prevItems = [1, 2, 3]
        
        XCTAssertEqual(prevItems + firstPage, items)
    }
    
    func testAppendCombine() {
        let prevItems = [1, 2, 3]
        let paging = LimitOffsetPaging(limit: randomLimit, offset: prevItems.count)
        let items = (0..<paging.limit).map { $0 }
        let page = PageType(paging: paging, items: items)
        
        XCTAssertEqual(PageType.combine(prevItems: prevItems + items, new: page), items)
    }
    
    func testAppendOptionalCombine() {
        let prevItems = [1, 2, 3]
        let paging = LimitOffsetPaging(limit: randomLimit, offset: prevItems.count)
        let items = (0..<paging.limit).map { $0 }
        let page = Optional(PageType(paging: paging, items: items))
        
        XCTAssertEqual(PageType.combine(prevItems: prevItems + items, new: page), items)
    }
    
    func testAppendPlus() {
        let prevItems = [1, 2, 3]
        let paging = LimitOffsetPaging(limit: randomLimit, offset: prevItems.count)
        let items = (0..<paging.limit).map { $0 }
        let page = PageType(paging: paging, items: items)
        
        XCTAssertEqual(prevItems + items + page, items)
    }
}
