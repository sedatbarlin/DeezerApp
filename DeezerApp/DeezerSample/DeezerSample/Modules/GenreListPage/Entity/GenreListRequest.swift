//
//  GenreListRequest.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import Foundation

struct GenreListRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init() {
        method = .GET
        url = Constant.baseUrl + "genre"
        body = nil
    }
}
