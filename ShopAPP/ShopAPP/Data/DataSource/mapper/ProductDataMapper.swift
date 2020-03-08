//
//  ProductListMapper.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 08/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductDataMapper {
    func convert(dict: [String:Any] ) -> ProductData{
        return ProductData(dict: dict)
    }
    
    func convert(data: Data) -> [ProductData]?{
        var productDataList = [ProductData]()
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []){
            guard let array = json as? [Any] else { return nil}
            for item in array{
                if let itemDict = item as? [String:Any]{
                    let productData = convert(dict: itemDict)
                    productDataList.append(productData)
                    
                }
            }
        }
        print (productDataList)
        return productDataList
    }
}
