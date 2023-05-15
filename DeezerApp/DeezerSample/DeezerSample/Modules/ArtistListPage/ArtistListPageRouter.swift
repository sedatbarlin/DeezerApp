//
//  ArtistListPageRouter.swift
//  DeezerSample
//
//  Created by Sedat on 10.05.2023.
//

import Foundation
import UIKit

protocol ArtistListPageRouterProtocol {
    func navigateToArtistsDetail(to id: String)
}

final class ArtistListPageRouter {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?, genreID: String, genreName: String) -> ArtistListPageVC {
        let view = ArtistListPageVC()
        let interactor = ArtistListPageInteractor()
        let router = ArtistListPageRouter(navigationController: navigationController)
        let presenter = ArtistListPagePresenter(view: view,
                                           interactor: interactor,
                                           router: router,
                                           genreID: genreID,
                                           genreName: genreName)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}

extension ArtistListPageRouter: ArtistListPageRouterProtocol {
    func navigateToArtistsDetail(to id: String) {
        let artistDetailPage = ArtistDetailRouter.createModule(navigationController: navigationController, artistID: id)
        self.navigationController?.pushViewController(artistDetailPage, animated: true)
    }
}
