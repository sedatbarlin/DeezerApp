//
//  ArtistDetailRouter.swift
//  DeezerSample
//
//  Created by Sedat on 11.05.2023.
//

import Foundation
import UIKit

protocol ArtistDetailRouterProtocol {
    func navigateToArtistsDetail(to id: String)
    func navigateToAlbumdetail(to id: String, name: String)
}

final class ArtistDetailRouter {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?, artistID: String) -> ArtistDetailPageVC {
        let view = ArtistDetailPageVC()
        let interactor = ArtistDetailPageInteractor()
        let router = ArtistDetailRouter(navigationController: navigationController)
        let presenter = ArtistDetailPagePresenter(view: view,
                                           interactor: interactor,
                                           router: router,
                                           artistID: artistID)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}

extension ArtistDetailRouter: ArtistDetailRouterProtocol {
    func navigateToAlbumdetail(to id: String, name: String) {
        let albumPage = AlbumDetailRouter.createModule(navigationController: navigationController, albumID: id, albumName: name)
        self.navigationController?.pushViewController(albumPage, animated: true)
    }
    
    func navigateToArtistsDetail(to id: String) {
        let artistDetailPage = ArtistDetailRouter.createModule(navigationController: navigationController, artistID: id)
        self.navigationController?.pushViewController(artistDetailPage, animated: true)
    }
}
