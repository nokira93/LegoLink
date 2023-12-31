//
//  LoadingScreenControllerViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 31/08/2023.
//

import UIKit

class LoadingScreenControllerViewController: UIViewController {

    let loadingView = LoadingView()
    let progress: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
//        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
//        view.isOpaque = false
//        view.backgroundColor = .white
        self.view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        loadingView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
    }
    

}
