//
//  GroupsSetsCell.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 20/08/2023.
//

import UIKit

class GroupsSetsCell: UICollectionViewCell {
    var name: String = ""
    var label: UILabel = {
        let label = UILabel()
        
        return label
    }()
    var image:UIImageView = {
        let image = UIImageView(image: UIImage(named: "test"))
        return image
    }()
    var backView: UIView = {
        let view = UIView()
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstraints() {
        self.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        backView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10).isActive = true
        backView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
