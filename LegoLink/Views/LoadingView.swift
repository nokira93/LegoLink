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
    let numOfElements: Int = SeriesTypes.allCases.count
    var progress:Double
    var progressLabel:UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    init(){
        progress = Double(0 / numOfElements * 100)
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        progressLabel.text = "\(Int(progress)) %"
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshView(progress: Int){
        let newProgress = Int(progress / numOfElements * 100)
        progressLabel.text = "\(newProgress) %"
    }
    
    func setUpConstraints(){
        self.addSubview(loadingActivityIndicator)
        loadingActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingActivityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressLabel.topAnchor.constraint(equalTo: self.loadingActivityIndicator.bottomAnchor).isActive = true
    }
    
}
