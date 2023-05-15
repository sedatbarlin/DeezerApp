//
//  FavoritesPageInteractor.swift
//  DeezerSample
//
//  Created by Sedat on 14.05.2023.
//

import Foundation

protocol FavoritesPageInteractorProtocol {
    func getFavorites()
    func deleteFavorite(at link: String)
}

final class FavoritesPageInteractor: FavoritesPageInteractorProtocol {
    weak var output: FavoritesInteractorOutput?
    
    func getFavorites() {
        let favorites = DataBaseController.shared.fetch()
        output?.handleTrackResult(with: .success(favorites))
    }
    
    func deleteFavorite(at link: String) {
        DataBaseController.shared.deleteTrack(at: link)
    }
}
