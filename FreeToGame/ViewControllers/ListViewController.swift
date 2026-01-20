//
//  ViewController.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            //let gameList = await GameProvider.getGameList()
            let game = await GameProvider.getGameById(id: 540)
            if let game = game {
                print(game)
            } else {
                print("Hubo un error parseando los datos")
            }
        }
    }


}

