//
//  GameProvider.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation

class GameProvider {
    
    static func getGameList() async -> [Game] {
        let url = URL(string: "\(Constants.SERVER_BASE_URL)/games")
        
        guard let url = url else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode([Game].self, from: data)
            
            return result
        } catch {
            print("Invalid data")
            return []
        }
    }
    
    static func getGameById(id: Int) async -> Game? {
        let url = URL(string: "\(Constants.SERVER_BASE_URL)/game?id=\(id)")
        
        guard let url = url else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(Game.self, from: data)
            
            return result
        } catch {
            print("Invalid data")
            return nil
        }
    }
}
