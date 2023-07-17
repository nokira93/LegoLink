//
//  Colors.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 17/07/2023.
//

import UIKit

public class Colors {
    static let colorTop = UIColor(red: 134/255.0, green: 191/255.0, blue: 93/255.0, alpha: 1.0).cgColor
    static let colorBottom = UIColor(red: 24/255.0, green: 30/255.0, blue: 32/255.0, alpha: 1.0).cgColor
    
    static func getBackground(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Colors.colorTop, Colors.colorBottom]
        gradientLayer.startPoint = CGPointMake(0, 1)
        gradientLayer.startPoint = CGPointMake(1, 0)
//        gradientLayer.locations = [0.0, 0.7]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)}
  static let backgroundColor = UIColor(red: 16/255.0, green: 54/255.0, blue: 47/255.0, alpha: 1.0)
  static let backgroundTaBarColor = UIColor(red: 35/255.0, green: 108/255.0, blue: 95/255.0, alpha: 1.0)
}
