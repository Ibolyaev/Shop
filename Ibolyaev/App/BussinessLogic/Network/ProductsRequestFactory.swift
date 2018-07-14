//
//  GoodsRequestFactory.swift
//  Ibolyaev
//
//  Created by Ronin on 13/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import Alamofire

protocol ProductsRequestFactory {
    func getList(category: Int,
                 page: Int,
                 completionHandler: @escaping (DataResponse<[Product]>) -> Void
    )
    func getWith(id: Int,
                 completionHandler: @escaping (DataResponse<ProductResponse>) -> Void
    )
}
