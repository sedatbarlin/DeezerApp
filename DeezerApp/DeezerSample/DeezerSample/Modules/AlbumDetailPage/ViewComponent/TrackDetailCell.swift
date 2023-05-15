//
//  TrackDetailCell.swift
//  DeezerSample
//
//  Created by Sedat on 12.05.2023.
//

import UIKit

protocol TrackDetailCellDelegate: AnyObject {
    func tapFavorite(index: Int, data: AlbumDetailTrackListData?)
    func tapShare(index: Int)
}

final class TrackDetailCell: UICollectionViewCell {
    static let reuseIdentifier: String = "TrackDetailCell"
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet private weak var trackTitle: UILabel!
    @IBOutlet private weak var trackDuration: UILabel!
    
    weak var delegate: TrackDetailCellDelegate?
    
    var index: Int = 0
    var data: AlbumDetailTrackListData? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(index: Int, data: AlbumDetailTrackListData) {
        trackTitle.text = data.title
        trackDuration.text = String(data.duration)
        self.index = index
        self.data = data
    }

    @IBAction func tapFavorite(_ sender: Any) {
        delegate?.tapFavorite(index: index, data: data)
    }
    @IBAction func tapShare(_ sender: Any) {
        delegate?.tapShare(index: index)
    }
}
