//
//  ArtistDetailPageAlbumCell.swift
//  DeezerSample
//
//  Created by Sedat on 11.05.2023.
//

import UIKit

final class ArtistDetailPageAlbumCell: UICollectionViewCell {
    static let reuseIdentifier: String = "ArtistDetailPageAlbumCell"
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet private weak var albumName: UILabel!
    @IBOutlet private weak var albumReleaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImage.clipsToBounds = true
        albumImage.layer.cornerRadius = 8
    }
    
    func setData(title: String, date: String) {
        albumName.text = title
        albumReleaseDate.text = date
    }

}
