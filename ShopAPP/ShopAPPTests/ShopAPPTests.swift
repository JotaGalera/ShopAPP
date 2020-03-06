//
//  ShopAPPTests.swift
//  ShopAPPTests
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import XCTest
@testable import ShopAPP

class ProductListTest: XCTestCase {
    var sut : ProductList?
    
    override func setUp() {
        super.setUp()
        let arrayEmpty : [ProductDomain] = []
        sut = ProductList(arrayProducts: arrayEmpty)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAddProduct(){
        let mockProduct = ProductDomain(name: "shirts", brand: "Tommy Hilfiger", price: 80, currency: "€", image: "https://picture.bestsecret.com/static/images/1041/image_31394462_20_620x757_0.jpg")
        
        sut?.addProductsToList(product: mockProduct)
        
        XCTAssertEqual(sut?.getProductToList(index: 0), mockProduct)
    }
}
