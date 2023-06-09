//
//  AlbumDetailResponse.swift
//  DeezerSample
//
//  Created by Sedat on 12.05.2023.
//

import Foundation

struct AlbumDetailResponse: Decodable {
    let id: Int
    let title: String
    let cover: String
    let coverSmall: String
    let coverMedium: String
    let coverBig: String
    let coverXl: String
    let fans: Int
    let tracks: TrackDetailDataResponse
    let artist: ArtistResponse
    
    enum CodingKeys: String, CodingKey {
        case id, title, cover, fans, tracks, artist
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
    }
}

struct TrackDetailDataResponse: Decodable {
    let data: [TrackDetailResponse]
}

struct TrackDetailResponse: Decodable {
    let id: Int
    let title: String
    let duration: Int
    let preview: String
    let link: String
}

struct AlbumDetailTrackListData: Hashable {
    let id: Int
    var albumImage: String
    let title: String
    let duration: Int
    let preview: String
    let artistName: String
    let albumName: String
    let link: String
}
