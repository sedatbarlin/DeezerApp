//
//  ArtistDetailRequest.swift
//  DeezerSample
//
//  Created by Sedat on 11.05.2023.
//

import Foundation

struct ArtistDetailRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init(id: String) {
        method = .GET
        url = Constant.baseUrl + "artist" + "/\(id)"
        body = nil
    }
}

struct ArtistAlbumsRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init(id: String) {
        method = .GET
        url = Constant.baseUrl + "artist" + "/\(id)" + "/albums"
        body = nil
    }
}

struct ArtistRelatedRequest: ApiRequestProtocol {
    var method: HttpMethod
    var url: String
    var body: Encodable?
    
    init(id: String) {
        method = .GET
        url = Constant.baseUrl + "artist" + "/\(id)" + "/related"
        body = nil
    }
}
