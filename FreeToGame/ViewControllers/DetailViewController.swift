//
//  DetailViewController.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var osLabel: UILabel!
    @IBOutlet weak var processorLabel: UILabel!
    @IBOutlet weak var memoryLabel: UILabel!
    @IBOutlet weak var graphicsLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = game.title
        
        collectionView.dataSource = self
        
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
        
        collectionView.reloadData()
        
        osLabel.text = game.systemRequirments?.os
        processorLabel.text = game.systemRequirments?.processor
        memoryLabel.text = game.systemRequirments?.memory
        graphicsLabel.text = game.systemRequirments?.graphics
        storageLabel.text = game.systemRequirments?.storage
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.screenshots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Screenshot Cell", for: indexPath) as! ScreenshotViewCell
        let screenshot = game.screenshots![indexPath.row]
        cell.configure(with: screenshot)
        return cell
    }
    
    @IBAction func toggleDescription(_ sender: Any) {
        descriptionLabel.numberOfLines = descriptionLabel.numberOfLines == 0 ? 5 : 0
    }

    @IBAction func openStore(_ sender: Any) {
        if let url = URL(string: game.gameURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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
