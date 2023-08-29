//
//  SettingsView.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 29/08/2023.
//

import UIKit

class SettingsView: UIView {
    
    var button:UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Press to reload CoreData"
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.isEnabled = true
        return button
    }()
    init() {
        super.init(frame: .zero)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: #selector(reloadCoreData), for: .touchUpOutside)
        button.backgroundColor = .yellow

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func reloadCoreData() {
        print("Test")
    }
}
