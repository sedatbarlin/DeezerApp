//
//  ApiResponse.swift
//  DeezerSample
//
//  Created by Sedat on 9.05.2023.
//

import Foundation

/// Some list data return inside `data` field
struct ApiResponseWithInData<T: Decodable>: Decodable {
    let data: T
}

struct ApiResponseErrorType: Decodable {
    let error: ApiResponseError
}

/// Generic Deezer Api error response type
struct ApiResponseError: Decodable {
    let type: String
    let message: String
    let code: Int
}
