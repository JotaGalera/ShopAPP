//
//  APIRepository.swift
//  ShopAPP
//
//  Created by Galera, Javier on 06/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

protocol APIRepository{
    func getProductList(completion: @escaping (ProductList) -> ())
}
