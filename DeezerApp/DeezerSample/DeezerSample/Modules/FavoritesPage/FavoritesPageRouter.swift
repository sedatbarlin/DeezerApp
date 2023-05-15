//
//  FavoritesPageRouter.swift
//  DeezerSample
//
//  Created by Sedat on 14.05.2023.
//

import Foundation
import UIKit

protocol FavoritesPageRouterProtocol {}

final class FavoritesPageRouter: FavoritesPageRouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController?) -> FavoritesPageVC {
        let view = FavoritesPageVC()
        let interactor = FavoritesPageInteractor()
        let router = FavoritesPageRouter(navigationController: navigationController)
        let presenter = FavoritesPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}
