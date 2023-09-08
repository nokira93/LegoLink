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
//    case disney = "disney"
//    case friends = "friends"
//    case icons = "icons"
//    case mincefraft = "mincefraft"
//    case superHeroesDC = "superHeroesDC"
//    case superMario = "superMario"
//    case dreamzzz = "dreamzzz"
//    
    func getString(set: SeriesTypes) -> String{
        switch set {
        case .harryPotter: return "Harry%20Potter"
        case .starWars: return "Star%20Wars"
        case .technic: return "technic"
        case .avengers: return "avengers"
        case .ninjago: return "ninjago"
        case .architecture: return "architecture" // liczba setow sie nie zgadza
        case .brickheadz: return "brickheadz"
        case .city: return "city"
        case .classic: return "classic"
        case .creator: return "creator"
//        case .disney: return "disney"
//        case .friends: return "friends"
//        case .icons: return "icons"
//        case .mincefraft: return "mincefraft"
//        case .superHeroesDC: return "super%20Heroes%20DC"
//        case .superMario: return "superMario"
//        case .dreamzzz: return "dreamzzz"
        }
    }
    
    func getId(set: SeriesTypes) -> Int{
        switch set {
        case .harryPotter: return 246
        case .starWars: return 18
        case .technic: return 453
        case .avengers: return 702
        case .ninjago: return 435
        case .architecture: return 252
        case .brickheadz: return 610
        case .city: return 52
        case .classic: return 513
        case .creator: return 22
//        case .disney: return 608
//        case .friends: return 595
//        case .icons: return 721
//        case .mincefraft: return 577
//        case .superHeroesDC: return 592
//        case .superMario: return 690
//        case .dreamzzz: return 749
        }
    }
}
