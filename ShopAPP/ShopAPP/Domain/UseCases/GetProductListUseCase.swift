//
//  GetProductListUseCase.swift
//  ShopAPP
//
//  Created by Javier Galera Garrido on 05/03/2020.
//  Copyright © 2020 Javier Galera Garrido. All rights reserved.
//

import Foundation

protocol GetProductListUseCase {
    func execute(completion: @escaping (ProductList) -> () )
}

class GetProductListUseCaseImplementation : GetProductListUseCase {
    func execute(completion: @escaping (ProductList) -> () ){
        
    }
}
