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
        let mockJson = MockJson()
        
        sut?.getProductList(completion: { string in
            expectation.fulfill()
            XCTAssertEqual(string, mockJson.value)
        })
        
    }
}
struct MockJson {
    let value : String =
    "list: [{id: 1,name: shirts,brand: Tommy Hilfiger,price: 80,currency: €,image: https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg,_link: http://bestsecret-recruitment-api.herokuapp.com/products/1,_type: product}],page: 1,pageSize: 1,size: 20,_link: http://bestsecret-recruitment-api.herokuapp.com/products?page=1&pageSize=1,_type: products,_next: http://bestsecret-recruitment-api.herokuapp.com/products?page=2&pageSize=1"

}
