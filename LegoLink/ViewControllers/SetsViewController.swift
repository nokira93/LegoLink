//
//  SetsViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 11/07/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class SetsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, ApiProviderDelegate {
    func didUpdate(_ manager: APIManager, sets: LegoSetModel) {
        print(sets)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

    var setCollectionView: UICollectionView?
    var allSeries = SeriesTypes.allCases
    var apIManager = APIManager()
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
            
            apIManager.delegate = self
            setCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//            setCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "GroupsSetsCell")

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
        
//        guard let myCell = setCollectionView?.dequeueReusableCell(withReuseIdentifier: "GroupsSetsCell", for: indexPath) as? GroupsSetsCell else {
//            fatalError("Error")
//        }
//        let cell = setCollectionView?.dequeueReusableCell(withReuseIdentifier: "GroupSetsCell", for: indexPath) as! GroupsSetsCell
//        cell.backgroundColor = .clear
//        return cell
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)

        let imageview:UIImageView = UIImageView()
        imageview.backgroundColor = .clear
        myCell.backgroundColor = .clear
        imageview.contentMode = .scaleToFill
        let image:UIImage = UIImage(named: allSeries[indexPath.row].rawValue) ?? UIImage()
        imageview.image = image

        myCell.backgroundView = imageview

        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let secondViewController = ListOfSets()
        apIManager.fetchWeatcher(setName: "Harry%20Potter")

        self.present(secondViewController, animated: true, completion: nil)
    }
}
