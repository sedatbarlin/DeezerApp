//
//  GenreListPresenter.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import Foundation
import UIKit.NSDiffableDataSourceSectionSnapshot

typealias GenreListPageSnapshot = NSDiffableDataSourceSnapshot<GenreListSection, GenreResponse>

protocol GenreListPresenterProtocol {
    func viewDidLoad()
    func selectGenre(at index: Int)
}

final class GenreListPresenter {
    weak var view: GenreListViewProtocol?
    private let interactor: GenreListInteractor
    private let router: GenreListRouterProtocol
    private(set) var genreList: [GenreResponse] = []
    
    init(view: GenreListViewProtocol, interactor: GenreListInteractor, router: GenreListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GenreListPresenter: GenreListPresenterProtocol {
    func viewDidLoad() {
        view?.prepareUI()
        interactor.getGenres()
        view?.setLoading(isLoading: true)
    }
    
    func selectGenre(at index: Int) {
        let genre = genreList[index]
        router.navigateToGenresArtist(to: String(genre.id), genreName: genre.name)
    }
}

extension GenreListPresenter: GenreListInteractorOutput {
    func handleSearchResult(with result: Result<[GenreResponse], ApiError>) {
        switch result {
        case .success(let genreList):
            self.genreList = genreList
            var snapshot = GenreListPageSnapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(genreList, toSection: .main)
            view?.showGenreList(with: snapshot)
        case .failure(let error):
            view?.showError(errorDescription: error.localizedDescription)
        }
        view?.setLoading(isLoading: false)
    }
}
