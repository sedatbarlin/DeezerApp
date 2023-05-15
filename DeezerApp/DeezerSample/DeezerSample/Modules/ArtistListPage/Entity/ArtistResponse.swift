//
//  ArtistResponse.swift
//  DeezerSample
//
//  Created by Sedat on 10.05.2023.
//

import Foundation

struct ArtistResponse: Decodable, Hashable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall: String
    let pictureMedium: String
    let pictureBig: String
    let pictureXl: String
    let tracklist: String
    let nbAlbum: Int?
    let nbFan: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, picture, tracklist
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case nbAlbum = "nb_album"
        case nbFan = "nb_fan"
    }
}
