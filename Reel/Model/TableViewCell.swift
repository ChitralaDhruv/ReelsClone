//
//  TableViewCell.swift
//  Reel
//
//  Created by Chitrala Dhruv on 10/01/23.
//

import UIKit
import AVFoundation

class TableViewCell: UITableViewCell {
    
    var player: AVPlayer?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with model: VideoModel) {
        
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("failed")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        
        contentView.layer.addSublayer(playerView)
        
        player?.volume = 0
        player?.play()
    }

}
