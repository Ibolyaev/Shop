//
//  CartItem.swift
//  Ibolyaev
//
//  Created by Ronin on 05/08/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import Foundation
/*
 {
 "id_product": 456,
 "product_name": "Мышка",
 "price": 1000,
 "quantity": 1
 }
 */

struct CartItem: Codable {
    let productId: Int
    let productName: String
    let price: Int
    var quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
