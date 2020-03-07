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
        let productListEmpty = ProductList(arrayProducts: [ProductDomain(name: "", brand: "", price: 0, currency: "", image: "")])
        let mockedAPIDataSource = MockedAPIDataSource()
        
        sut?.getProductList(completion: { product in
            expectation.fulfill()
            XCTAssertEqual(product, productListEmpty)
        })
    }

}
class MockedAPIDataSource : APIDataSource{
    
}
