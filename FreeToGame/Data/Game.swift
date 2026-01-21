//
//  Game.swift
//  FreeToGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation
import UIKit

struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let profileURL: String
    let description: String?
    let systemRequirments: SystemRequirments?
    let screenshots: [Screenshot]?
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case releaseDate = "release_date"
        case profileURL = "freetogame_profile_url"
        case systemRequirments = "minimum_system_requirements"
        case id, title, thumbnail, genre, platform, publisher, developer, description, screenshots
    }
}

struct SystemRequirments: Codable {
    let os: String
    let processor: String
    let memory: String
    let graphics: String
    let storage: String
}

struct Screenshot: Codable {
    let image: String
}
