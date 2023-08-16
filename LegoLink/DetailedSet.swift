//
//  DetailedSet.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 12/07/2023.
//

import UIKit

class DetailedSet: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var data: [LegoSetModel]? = []
    var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        

        view.backgroundColor = .magenta
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.backgroundColor = .yellow
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    

    func test() {
        data = CoreDataStack.shared.getStoredDataFromCoreData()
    }
}
extension DetailedSet {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .subtitle , reuseIdentifier: nil)
        myCell.contentView.backgroundColor = .blue
        
        myCell.textLabel?.text = data?[indexPath.row].name
        
        return myCell
    }
    
}
