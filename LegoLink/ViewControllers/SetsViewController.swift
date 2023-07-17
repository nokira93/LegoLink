//
//  SetsViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 11/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class SetsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
        var setCollectionView: UICollectionView?
    var allSeries = SeriesTypes.allCases
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        return layout
    }()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
//            Colors.getBackground(view: view)
            view.backgroundColor = Colors.backgroundColor
            setCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
            setCollectionView?.backgroundColor = .clear

            setCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")

            view.addSubview(setCollectionView ?? UICollectionView())
            
            setCollectionView?.dataSource = self
            setCollectionView?.delegate = self
        }
    }

extension SetsViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return SeriesTypes.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.magenta
        

        let imageview:UIImageView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
        
        imageview.contentMode = .scaleAspectFill
        let image:UIImage = UIImage(named: allSeries[indexPath.row].rawValue) ?? UIImage()
        imageview.image = image
        myCell.contentView.addSubview(imageview)
//        myCell.backgroundView?.embedView(imageview)
//        myCell.backgroundView?.embedView(imageview)
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - (lay.minimumInteritemSpacing * 3)
        
        return CGSize(width:widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let secondViewController:DetailedSet = DetailedSet()
        self.present(secondViewController, animated: true, completion: nil)
        print("Dupa \(indexPath.row)")
    }
}

extension UIView {
    func embedView(_ view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) {
        let topConstraint = NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1,
            constant: inset.top
        )
        let leadingConstraint = NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: inset.left
        )
        let trailingConstraint = NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: inset.right
        )
        let bottomConstraint = NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1,
            constant: inset.bottom
        )
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
