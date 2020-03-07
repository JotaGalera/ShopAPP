//
//  ProductList.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

class ProductList : Equatable{
    private var arrayProducts: [ProductDomain] = []
   
    init (arrayProducts: [ProductDomain]) {
        self.arrayProducts = arrayProducts
    }
    
    func addProductsToList( product: ProductDomain ){
        arrayProducts.append(product)
    }
    
    func getProductToList(index: Int) -> ProductDomain{
        return arrayProducts[index]
    }
    
    static func == (lhs: ProductList, rhs: ProductList) -> Bool {
        return lhs.arrayProducts == rhs.arrayProducts
    }
}
