//
//  PersonalViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 06/07/2023.
//

import UIKit

class PersonalViewController: UIViewController {

//    let testView = SettingsView()
    
    var button:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.text = "Press to reload CoreData"
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
//        testView.translatesAutoresizingMaskIntoConstraints = false
//        testView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        testView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        testView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        testView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            
        button.addTarget(self, action:#selector(self.reloadCoreData), for: .touchUpInside)
        button.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Colors.getBackground(view: view)

    }
    @objc func reloadCoreData() {
        print("Test")
    }
}
