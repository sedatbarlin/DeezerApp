//
//  FavoritesPageVC.swift
//  DeezerSample
//
//  Created by Sedat on 14.05.2023.
//

import UIKit

private typealias DataSource = UICollectionViewDiffableDataSource<FavoritesPageSection, AlbumDetailTrackListData>

protocol FavoritesPageViewProtocol: AnyObject {
    func prepareUI()
    func showTrackList(with snapshot: FavoritesPageSnapshot)
    func showError(errorDescription: String)
    func setLoading(isLoading: Bool)
    func share(trackUrl: String)
}

enum FavoritesPageSection {
    case main
}

final class FavoritesPageVC: UIViewController {
    var presenter: FavoritesPresenterProtocol!
    private var collectionView: UICollectionView!
    private var loadingIndicator: UIActivityIndicatorView!
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.title = "FAVORITES_PAGE_VC".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.reloadList()
    }
}

extension FavoritesPageVC: FavoritesPageViewProtocol {
    func prepareUI() {
        makeCollectionView()
        setActiviyIndicator()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func showTrackList(with snapshot: FavoritesPageSnapshot) {
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func showError(errorDescription: String) {
        let alert = UIAlertController(title: "ALERT_TITLE".localized, message: errorDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ALERT_CANCEL_BUTTON_TITLE".localized, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func setLoading(isLoading: Bool) {
        DispatchQueue.main.async { [self] in
            isLoading ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
        }
    }
    
    func share(trackUrl: String) {
        let objectsToShare:URL = URL(string: trackUrl)!
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject]
        let activityViewController = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension FavoritesPageVC {
    func setActiviyIndicator() {
        loadingIndicator = UIActivityIndicatorView()
        self.view.addSubview(loadingIndicator)
        loadingIndicator.center = self.view.center
        loadingIndicator.hidesWhenStopped = true
    }
}

extension FavoritesPageVC: UICollectionViewDelegate {
    func makeCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.register(UINib.loadNib(name: TrackDetailCell.reuseIdentifier), forCellWithReuseIdentifier: TrackDetailCell.reuseIdentifier)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackDetailCell.reuseIdentifier, for: indexPath) as? TrackDetailCell
            cell?.setData(index: indexPath.row, data: data)
            cell?.trackImage.loadImage(from: data.albumImage)
            cell?.delegate = self
            cell?.index = indexPath.row
            return cell
        })
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            return layoutSection
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectTrack(at: indexPath.row)
    }
}

extension FavoritesPageVC: TrackDetailCellDelegate {
    func tapFavorite(index: Int, data: AlbumDetailTrackListData?) {
        presenter.unfavoriteTrack(at: index, data: data)
    }
    
    func tapShare(index: Int) {
        presenter.shareTrack(at: index)
    }
}
