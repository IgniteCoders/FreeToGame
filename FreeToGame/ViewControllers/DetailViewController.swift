//
//  DetailViewController.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = game.title
        
        Task {
            game = await GameProvider.getGameById(id: game.id)
            
            DispatchQueue.main.async {
                self.loadData()
            }
        }
    }
    
    func loadData() {
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        descriptionLabel.text = game.description
        
        platformImageView.image = game.getPlatformImage()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
