//
//  ArtistDetailSelectorCell.swift
//  DeezerSample
//
//  Created by Sedat on 11.05.2023.
//

import UIKit

protocol ArtistDetailSelectorCellDelegate: AnyObject {
    func indexChanged(to index: Int)
}

final class ArtistDetailSelectorCell: UICollectionViewCell {
    static let reuseIdentifier: String = "ArtistDetailSelectorCell"
    @IBOutlet private weak var indexSelector: UISegmentedControl!
    
    weak var delegate: ArtistDetailSelectorCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        indexSelector.setTitle("INDEX_ALBUMS".localized, forSegmentAt: 0)
        indexSelector.setTitle("INDEX_RELATED_ARTISTS".localized, forSegmentAt: 1)
    }

    @IBAction private func indexChanged(_ sender: UISegmentedControl) {
        delegate?.indexChanged(to: sender.selectedSegmentIndex)
    }
}
