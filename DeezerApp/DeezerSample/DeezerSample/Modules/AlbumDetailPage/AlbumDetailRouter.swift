//
//  AlbumDetailRouter.swift
//  DeezerSample
//
//  Created by Sedat on 12.05.2023.
//

import Foundation
import UIKit

protocol AlbumDetailRouterProtocol {}

final class AlbumDetailRouter: AlbumDetailRouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?, albumID: String, albumName: String) -> AlbumDetailPageVC {
        let view = AlbumDetailPageVC()
        let interactor = AlbumDetailInteractor()
        let router = AlbumDetailRouter(navigationController: navigationController)
        let presenter = AlbumDetailPresenter(view: view,
                                           interactor: interactor,
                                           router: router,
                                           albumID: albumID,
                                           albumName: albumName)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}
