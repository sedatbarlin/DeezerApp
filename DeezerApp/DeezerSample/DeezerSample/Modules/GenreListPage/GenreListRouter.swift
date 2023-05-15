//
//  GenreListRouter.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import Foundation
import UIKit

protocol GenreListRouterProtocol {
    func navigateToGenresArtist(to id: String, genreName: String)
}

final class GenreListRouter {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController) -> GenreListPage {
        let view = GenreListPage()
        let interactor = GenreListInteractor()
        let router = GenreListRouter(navigationController: navigationController)
        let presenter = GenreListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}

extension GenreListRouter: GenreListRouterProtocol {
    func navigateToGenresArtist(to id: String, genreName: String) {
        let artistPage = ArtistListPageRouter.createModule(navigationController: navigationController,
                                                           genreID: id,
                                                           genreName: genreName)
        self.navigationController?.pushViewController(artistPage, animated: true)
    }
}
