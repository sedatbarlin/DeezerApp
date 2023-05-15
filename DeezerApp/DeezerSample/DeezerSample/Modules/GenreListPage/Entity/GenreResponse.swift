//
//  GenreListResponse.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import Foundation

struct GenreResponse: Decodable, Hashable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall: String
    let pictureMedium: String
    let pictureBig: String
    let pictureXl: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, picture, type
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
    }
}
