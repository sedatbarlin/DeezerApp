//
//  ApiExtension.swift
//  DeezerSample
//
//  Created by Sedat on 9.05.2023.
//

import Foundation

/// Deezer Api constant data
struct Constant {
    static let baseUrl = "https://api.deezer.com/"
}

/// Custom Api Error Type include network, decoding or url encode error
enum ApiError: Error {
    case network(errorMessage: String)
    case decoding(errorMessage: String)
    case urlEncode
    
    var localizedDescription: String {
        switch self {
        case .network(let message):
            return message
        case .decoding(let message):
            return message
        case .urlEncode:
            return "Url encode error"
        }
    }
}

enum HttpMethod: String {
    case GET
    case POST
}

extension Encodable {
    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
