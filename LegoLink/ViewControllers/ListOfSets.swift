//
//  ListOfSets.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 16/08/2023.
//

import UIKit
import CoreData
import SwiftUI


class ListOfSets: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var segmentPicker:UISegmentedControl = {
        let segment = UISegmentedControl(items: ["25", "50", "100"])
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = .systemGray4
        segment.tintColor = .white
        return segment
    }()
    let arr = [25, 50, 100]
    let screenWidth = UIScreen.main.bounds.width
    var searchBar = UISearchBar()
    var searchButton = UIButton()
    var numPicker :UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    var filter = UIButton()
    var tableView = UITableView()
    var itemsPerPage: Int = 25
    var dataSource: [LegoSetModel]? = []
    var modDataSource: [LegoSetModel]? = []
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        return scroll
    }()
    
    var viewWidth: CGFloat = 0
    var viewHeight: CGFloat = 0
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        return pageControl
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setUpPickersConstraints()
        viewWidth = scrollView.frame.size.width - 2 * Constraints.horizontalPadding
        viewHeight = scrollView.frame.size.height - 2 * Constraints.horizontalPadding
        
        self.view.backgroundColor = UIColor(red: 57/255, green: 57/255, blue: 56/255, alpha: 1)
        dataSource = CoreDataStack.shared.getStoredDataFromCoreData()
        modData()
        pageControl.numberOfPages = (modDataSource?.count ?? 0) / itemsPerPage
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.register(SetsCell.self, forCellReuseIdentifier: SetsCell.identifier)
        segmentPicker.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
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
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
        searchBar.layer.cornerRadius = 20
        searchBar.backgroundColor = .systemGray4
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = .white
        
        view.addSubview(numPicker)
        numPicker.translatesAutoresizingMaskIntoConstraints = false
        numPicker.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16).isActive = true
        numPicker.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        numPicker.heightAnchor.constraint(equalToConstant: 40).isActive = true
        numPicker.widthAnchor.constraint(equalTo: searchBar.widthAnchor, multiplier: 0.55).isActive = true
        numPicker.layer.cornerRadius = 20
        numPicker.backgroundColor = .systemGray4
        
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: numPicker.trailingAnchor, constant: 16).isActive = true
        searchButton.layer.cornerRadius = 20
        searchButton.backgroundColor = .systemGray4
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        
        view.addSubview(segmentPicker)
        segmentPicker.translatesAutoresizingMaskIntoConstraints = false
        segmentPicker.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 16).isActive = true
        segmentPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.horizontalPadding).isActive = true
        segmentPicker.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: segmentPicker.bottomAnchor, constant: 5).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.horizontalPadding).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.horizontalPadding).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * Constraints.bottomPadding).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * Constraints.horizontalPadding).isActive = true
    }
    func modData(){
        dataSource?.forEach({ item in
            if item.numParts != 0 {
                modDataSource?.append(item)
            }
        })
    }
}
extension ListOfSets {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsPerPage
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SetsCell.identifier, for: indexPath) as? SetsCell else {
            fatalError("Error")
        }
        cell.setUpView(url: modDataSource?[indexPath.row].setURL ?? "https://rebrickable.com/home/", name: modDataSource?[indexPath.row].name ?? "-", numOfParts: modDataSource?[indexPath.row].numParts ?? 0, imageURL: modDataSource?[indexPath.row].setImageURL ?? "-", setNum: modDataSource?[indexPath.row].setNum ?? "-")
        cell.backgroundColor = .clear
//        let myCell = UITableViewCell(style: .subtitle , reuseIdentifier: nil)
//        myCell.contentView.backgroundColor = .blue
//
//        myCell.textLabel?.text = dataSource?[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        SizeOfCell.height
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        itemsPerPage = arr[sender.selectedSegmentIndex]
        pageControl.numberOfPages = (modDataSource?.count ?? 0) / itemsPerPage
        tableView.reloadData()
     }
}
