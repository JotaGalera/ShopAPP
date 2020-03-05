//
//  ProductList.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductList {
    var arrayProducts: [ProductDomain] = []
   
    func addProductsToList( product: ProductDomain ){
        arrayProducts.append(product)
    }
}
