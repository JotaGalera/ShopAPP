//
//  getProductsList.swift
//  ShopAPPTests
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import XCTest
@testable import ShopAPP

class getProductsList: XCTestCase {
    let mockedAPIRepository : mockedAPIRepository?
    var sut : GetProductListUseCase?
    
    override func setUp() {
        super.setUp()
        sut = GetProductListUseCaseImplementation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExecute() {
        let expectation = XCTestExpectation(description: "Completion triggered")
        
        sut?.execute(completion: { product in
            expectation.fulfill()
        })
    }
}

