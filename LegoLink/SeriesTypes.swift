//
//  SeriesTypes.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 09/07/2023.
//

import Foundation

enum SeriesTypes: String, CaseIterable {
    case harryPotter = "harryPotter"
    case starWars = "starWars"
    case technic = "technic"
    case avengers = "avengers"
    case ninjago = "ninjago"
    case architecture = "architecture"
    case brickheadz = "brickheadz"
    case city = "city"
    case classic = "classic"
    case creator = "creator"
    case disney = "disney"
    case disneyPrincess = "disneyPrincess"
    case friends = "friends"
    case icons = "icons"
    case jurassicWorld = "jurassicWorld"
    case ideas = "ideas"
    case mincefraft = "mincefraft"
    case modularBuildings = "modularBuildings"
    case monkieKid = "monkieKid"
    case speedChampions = "speedChampions"
    case superHeroesDC = "superHeroesDC"
    case superMario = "superMario"
    
    func getString(set: SeriesTypes) -> String{
        switch set {
        case .harryPotter: return "Harry%20Potter"
        case .starWars: return
        case .technic: return
        case .avengers: return
        case .ninjago: return
        case .architecture: return
        case .brickheadz: return
        case .city: return
        case .classic: return
        case .creator: return
        case .disney: return
        case .disneyPrincess: return
        case .friends: return
        case .icons: return
        case .jurassicWorld: return
        case .ideas: return
        case .mincefraft: return
        case .modularBuildings: return
        case .monkieKid: return
        case .speedChampions: return
        case .superHeroesDC: return
        case .superMario: return
        }
    }
}
