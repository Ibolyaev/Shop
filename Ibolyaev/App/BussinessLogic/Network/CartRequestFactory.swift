//
//  CartRequestFactory.swift
//  Ibolyaev
//
//  Created by Ronin on 28/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import Alamofire

protocol CartRequestFactory {
    
    func add(product: Product,
             quantity: Int,
             completionHandler: @escaping (DataResponse<CartAddResult>
        ) -> Void
    )
    func remove(product: Product, completionHandler: @escaping (DataResponse<CartDeleteResult>) -> Void)
    func get(user: User, completionHandler: @escaping (DataResponse<CartGetResult>) -> Void)
}
