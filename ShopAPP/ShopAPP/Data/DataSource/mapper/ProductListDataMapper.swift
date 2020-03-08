//
//  ProductListDataMapper.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 08/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductListDataMapper {
    private let productDataMapper = ProductDataMapper()
    
    func convert(data: Data) -> ProductListData?{
        let productDataList = ProductListData(arrayProductData: [])
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return nil}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    let productData = productDataMapper.convert(dict: itemDict)
                    productDataList.addProductDataToList(productData: productData)
                }
            }
        }
        return productDataList
    }
}
