//
//  ProductListMapper.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 08/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductDataMapper {
    func convert(data: Data) -> ProductData{
        
        return ProductData(id: 1, name: " ", brand: " ", price: 1, currency: " ", image: " ", _link: " ", _type: " ")
    }
}
