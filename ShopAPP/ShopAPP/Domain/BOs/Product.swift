//
//  Product.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

struct ProductDomain {
    let name : String
    let brand : String
    let price : Int
    let currency : String
    let image : String
}
extension ProductDomain : Equatable{
    static func == (lhs : ProductDomain , rhs : ProductDomain) -> Bool{
        return lhs.name == rhs.name &&
                lhs.brand == rhs.brand &&
                lhs.price == rhs.price &&
                lhs.currency == rhs.currency &&
                lhs.image == rhs.image
    }
}
