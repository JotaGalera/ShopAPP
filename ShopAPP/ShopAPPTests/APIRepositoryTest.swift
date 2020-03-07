//
//  APIRepositoryTest.swift
//  ShopAPPTests
//
//  Created by Galera, Javier on 06/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import XCTest
@testable import ShopAPP

class APIRepositoryTest: XCTestCase {

    var sut : APIRepository?
    
    override func setUp() {
        super.setUp()
        sut = APIRepositoryImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetProductList() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.getProductList(completion: { product in
            expectation.fulfill()
        })
    }

}
