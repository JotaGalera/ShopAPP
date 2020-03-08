//
//  ProductData.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 08/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

struct ProductData {
    let id: Int
    let name: String
    let brand: String
    let price: Int
    let currency: String
    let image: String
    let _link: String
    let _type: String
}
extension ProductData : Equatable {
    static func ==(lhs: ProductData, rhs: ProductData)->Bool{
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.brand == rhs.brand &&
            lhs.price == rhs.price &&
            lhs.currency == rhs.currency &&
            lhs.image == rhs.image &&
            lhs._link == rhs._link &&
            lhs._type == rhs._type
    }
}
