//
//  ScreenshotViewCell.swift
//  FreeToGame
//
//  Created by Tardes on 22/1/26.
//

import UIKit

class ScreenshotViewCell: UICollectionViewCell {
    
    @IBOutlet weak var screenshotImageView: UIImageView!
    
    func configure(with screenshot: Screenshot) {
        screenshotImageView.loadFrom(url: screenshot.image)
    }
}
