//
//  SetsCell.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 17/08/2023.
//

import UIKit
import SDWebImage

class SetsCell: UITableViewCell {
    static let identifier = "SetsCell"
    
//    var url: String
//    var name: String
//    var numOfParts: Int16
    var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    let str = "Number of parts: "
    var image: UIImage = UIImage()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.05
        return label
    }()
    var partsLabel: UILabel = {
        let label = PaddingLabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .systemGray
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    var url = ""
//    var setNum: String
    var setView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraint() {
        self.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        backView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        backView.addSubview(setView)
        setView.translatesAutoresizingMaskIntoConstraints = false
        setView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        setView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        setView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20).isActive = true
        setView.widthAnchor.constraint(equalTo: setView.heightAnchor).isActive = true
        
        backView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: setView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10).isActive = true
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        button.setImage(UIImage(systemName: "globe", withConfiguration: config), for: .normal)
        button.addTarget(self, action: #selector(link), for: .touchUpInside)
                                      
        backView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: setView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: setView.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        
        backView.addSubview(partsLabel)
        partsLabel.translatesAutoresizingMaskIntoConstraints = false
        partsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        partsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        partsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    }
    public func setUpView(url: String, name: String, numOfParts: Int16, imageURL: String, setNum: String) {
        //            self.url = url
        nameLabel.text = name
        partsLabel.text = "\(str) \(numOfParts)"
        self.url = url
        //            self.name = name
        //            self.numOfParts = numOfParts
        //            self.setNum = setNum
        setView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        setUpConstraint()
    }
    @objc private func link() {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
class PaddingLabel: UILabel {
    
   var topInset: CGFloat = 5.0
    var bottomInset: CGFloat = 5.0
    var leftInset: CGFloat = 16.0
    var rightInset: CGFloat = 16.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
