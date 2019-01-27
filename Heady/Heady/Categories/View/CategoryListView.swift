//
//  CategoryListView.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import UIKit
import PKHUD

class CategoryListView: UIViewController{
    
@IBOutlet weak var tableView: UITableView!
var presenter: CategoryListPresenterProtocol?
var categoryList: [Category] = []

override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Heady"
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}

extension CategoryListView:CategoryListViewProtocol {
    
    func showError() {
        DispatchQueue.main.async {
            HUD.flash(.label("Internet not connected"), delay: 2.0)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            HUD.show(.progress, onView: self.view)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            HUD.hide()
        }
    }
    
    func showCategories(categories:[Category]) {
        self.categoryList = categories
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension CategoryListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        let category = categoryList[indexPath.row]
        cell.set(forCategory: category)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showCategoryDetail(forCategory: categoryList[indexPath.row])
    }
    
}
