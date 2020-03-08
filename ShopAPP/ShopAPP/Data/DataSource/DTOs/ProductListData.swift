//
//  ProductListData.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 08/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductListData {
    var arrayProductData : [ProductData] = []
    
    init(arrayProductData: [ProductData]){
        self.arrayProductData = arrayProductData
    }
    
    func addProductDataToList(productData: ProductData){
        arrayProductData.append(productData)
    }
}
extension ProductListData : Equatable {
    static func == (lhs: ProductListData, rhs: ProductListData) -> Bool {
        return lhs.arrayProductData == rhs.arrayProductData
    }
}
