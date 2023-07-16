//
//  DetailesSet.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 12/07/2023.
//

import UIKit

class DetailesSet: UICollectionViewCell {
    
    let image:String?
    let name: String
    let setNumer: String
    let setName: String
    let numberOfParts: Int
    let releaseYear: Int
    
    init(image: String, name: String, setNumer: String, setName: String, numberOfParts: Int, releaseYear: Int) {
        self.image = image
        self.name = name
        self.setNumer = setNumer
        self.setName = setName
        self.numberOfParts = numberOfParts
        self.releaseYear = releaseYear
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
