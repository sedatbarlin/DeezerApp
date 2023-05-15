//
//  AlbumDetailRequest.swift
//  DeezerSample
//
//  Created by Sedat on 12.05.2023.
//

import Foundation

struct AlbumDetailRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init(id: String) {
        method = .GET
        url = Constant.baseUrl + "/album" + "/\(id)"
        body = nil
    }
}
