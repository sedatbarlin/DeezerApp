//
//  FavoritesPresenter.swift
//  DeezerSample
//
//  Created by Sedat on 14.05.2023.
//

import Foundation
import UIKit.NSDiffableDataSourceSectionSnapshot

typealias FavoritesPageSnapshot = NSDiffableDataSourceSnapshot<FavoritesPageSection, AlbumDetailTrackListData>

protocol FavoritesPresenterProtocol {
    func viewDidLoad()
    func selectTrack(at index: Int)
    func unfavoriteTrack(at index: Int, data: AlbumDetailTrackListData?)
    func shareTrack(at index: Int)
    func reloadList()
}

protocol FavoritesInteractorOutput: AnyObject {
    func handleTrackResult(with result: Result<[AlbumDetailTrackListData], ApiError>)
}

final class FavoritesPresenter {
    weak var view: FavoritesPageViewProtocol?
    private let interactor: FavoritesPageInteractorProtocol
    private let router: FavoritesPageRouterProtocol
    
    private(set) var trackResult: [AlbumDetailTrackListData] = []
    
    init(view: FavoritesPageViewProtocol, interactor: FavoritesPageInteractorProtocol, router: FavoritesPageRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    func viewDidLoad() {
        view?.prepareUI()
    }
    
    func selectTrack(at index: Int) {
        var sortedList = trackResult
        sortedList.insert(sortedList.remove(at: index), at: 0)
        let player = MusicPlayer.player
        player.setTrackList(trackItems: sortedList)
        player.play()
    }
    
    func reloadList() {
        interactor.getFavorites()
    }
    
    func unfavoriteTrack(at index: Int, data: AlbumDetailTrackListData?) {
        if let data = data {
            interactor.deleteFavorite(at: data.link)
            reloadList()
        }
    }
    
    func shareTrack(at index: Int) {
        let track = trackResult[index]
        view?.share(trackUrl: track.link)
    }
}

extension FavoritesPresenter: FavoritesInteractorOutput {
    func handleTrackResult(with result: Result<[AlbumDetailTrackListData], ApiError>) {
        switch result {
        case .success(let data):
            self.trackResult = data
            self.trackResult.sort(by: {$0.title < $1.title})
            var snapshot = FavoritesPageSnapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(self.trackResult.compactMap({$0}), toSection: .main)
            view?.showTrackList(with: snapshot)
        case .failure(_):
            break
        }
    }
}
