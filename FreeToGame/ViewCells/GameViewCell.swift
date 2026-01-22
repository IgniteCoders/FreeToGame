//
//  GameViewCell.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class GameViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with game: Game) {
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        shortDescriptionLabel.text = game.shortDescription
        
        platformImageView.image = game.getPlatformImage()
        
        cardView.layer.cornerRadius = 32
        cardView.layer.masksToBounds = true
    }
}
