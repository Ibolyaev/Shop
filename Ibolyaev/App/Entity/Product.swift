//
//  Product.swift
//  Ibolyaev
//
//  Created by Ronin on 13/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
