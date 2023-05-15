//
//  ArtistListRequest.swift
//  DeezerSample
//
//  Created by Sedat on 10.05.2023.
//

import Foundation

struct ArtistListRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init(id: String) {
        method = .GET
        url = Constant.baseUrl + "genre" + "/\(id)" + "/artists"
        body = nil
    }
}
