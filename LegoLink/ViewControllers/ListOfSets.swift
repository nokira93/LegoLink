//
//  ListOfSets.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 16/08/2023.
//

import UIKit
import CoreData

//class ListOfSets: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
class ListOfSets: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var picker = UIPickerView()
    var searchBar = UISearchBar()
    var searchButton = UIButton()
    var numPicker = UIPickerView()
    var filter = UIButton()
    var tableView = UITableView()
    var itemsPerPage: Int = 30
    var dataSource: [LegoSetModel]? = []
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setUpPickersConstraints()
        self.view.backgroundColor = .blue
        dataSource = CoreDataStack.shared.getStoredDataFromCoreData()
        tableView.dataSource = self
        tableView.delegate = self
//        picker.dataSource = self
//        picker.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUpPickersConstraints() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: Constraints.topPadding).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.horizontalPadding).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
        searchBar.layer.cornerRadius = 25
        searchBar.backgroundColor = .systemGray4
        
        view.addSubview(numPicker)
        numPicker.translatesAutoresizingMaskIntoConstraints = false
        numPicker.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16).isActive = true
        numPicker.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        numPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        numPicker.widthAnchor.constraint(equalTo: searchBar.widthAnchor, multiplier: 0.55).isActive = true
        numPicker.layer.cornerRadius = 25
        numPicker.backgroundColor = .systemGray4
        
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: numPicker.trailingAnchor, constant: 16).isActive = true
        searchButton.layer.cornerRadius = 25
        searchButton.backgroundColor = .systemGray4
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.horizontalPadding).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * Constraints.bottomPadding).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
    }
}
extension ListOfSets {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        <#code#>
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsPerPage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .subtitle , reuseIdentifier: nil)
        myCell.contentView.backgroundColor = .blue
        
        myCell.textLabel?.text = dataSource?[indexPath.row].name
        
        return myCell
    }
}
