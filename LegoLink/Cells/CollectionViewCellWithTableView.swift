//
//  CollectionViewCellWithTableView.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 28/08/2023.
//

import UIKit

//class CollectionViewCellWithTableView: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
//
//    var tableView: UITableView = {
//        let table = UITableView()
//        
//        return table
//    }()
//    var numerOfRows: Int
//    
//    init(rows: Int){
//        super.init(frame: .zero)
//        
//        self.numerOfRows = rows
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        tableView.register(UITableView.self, forCellReuseIdentifier: "MyCell")
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return numerOfRows
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//}
