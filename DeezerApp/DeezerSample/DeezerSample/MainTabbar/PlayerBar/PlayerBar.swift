//
//  PlayerBar.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import UIKit

protocol PlayerBarDelegate: AnyObject {
    func tapPlayPause()
    func tapForward()
    func tapVolume()
}

final class PlayerBar: UIView {
    @IBOutlet private weak var trackArtwork: UIImageView!
    @IBOutlet private weak var trackName: UILabel!
    @IBOutlet private weak var playButton: UIButton!
    
    weak var delegate: PlayerBarDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(title: String, image: UIImage) {
        trackName.text = title
        trackArtwork.image = image
    }
    
    func updatePlayButton(to isPlaying: Bool) {
        playButton.setImage(isPlaying ? UIImage(systemName: "pause.fill") : UIImage(systemName: "play.fill"), for: .normal)
    }
    
    @IBAction private func tapPlayPause(_ sender: Any) {
        delegate?.tapPlayPause()
    }
    @IBAction private func tapForward(_ sender: Any) {
        delegate?.tapForward()
    }
    @IBAction private func tapVolume(_ sender: Any) {
        delegate?.tapVolume()
    }
}
