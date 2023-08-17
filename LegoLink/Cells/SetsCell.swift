//
//  SetsCell.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 17/08/2023.
//

import UIKit

class SetsCell: UITableViewCell {
    static let identifier = "SetsCell"
    
//    var url: String
//    var name: String
//    var numOfParts: Int16
    var image: UIImage = UIImage()
    var nameLabel: UILabel = UILabel()
    var partsLabel: UILabel = UILabel()
//    var setNum: String
    var setView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "figure.roll")
        return iv
    }()
    
    var button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraint() {
        self.contentView.addSubview(setView)
        setView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        setView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        setView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -20).isActive = true
        setView.widthAnchor.constraint(equalTo: setView.heightAnchor).isActive = true
        
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        self.contentView.addSubview(partsLabel)
        partsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        partsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        
        self.contentView.addSubview(button)
        button.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: partsLabel.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        

    }
    public func setUpView(url: String, name: String, numOfParts: Int16, imageURL: String, setNum: String) {
//            self.url = url
//            self.name = name
//            self.numOfParts = numOfParts
//            self.setNum = setNum
            setUpConstraint()
            self.backgroundColor = .yellow
    }
}
