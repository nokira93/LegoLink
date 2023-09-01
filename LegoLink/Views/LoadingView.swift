//
//  LoadingView.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 31/08/2023.
//

import UIKit

class LoadingView: UIView {

    var loadingActivityIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.style = .large
        loading.color = .white
        loading.startAnimating()
        return loading
     }()
    init(){
        
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.addSubview(loadingActivityIndicator)
        loadingActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingActivityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        loadingActivityIndicator.heightAnchor.constraint(equalToConstant: 200).isActive = true
        loadingActivityIndicator.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    var blurEffectView: UIVisualEffectView = {
//            // UIVisualEffectView Configuration
//        }()
        
}
