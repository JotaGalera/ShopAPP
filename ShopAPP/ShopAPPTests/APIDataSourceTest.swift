//
//  APIDataSourceTest.swift
//  ShopAPPTests
//
//  Created by Javier Galera Garrido on 07/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import XCTest
@testable import ShopAPP

class APIDataSourceTest: XCTestCase {
    
    var sut : APIDataSource?
    
    override func setUp() {
        super.setUp()
        sut = APIDataSourceImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductList() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(completion: { string in
            expectation.fulfill()
        })
    }
}
