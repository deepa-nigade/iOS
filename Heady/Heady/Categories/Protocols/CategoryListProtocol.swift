//
//  CategoryListProtocol.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryListViewProtocol:class {
    var presenter:CategoryListPresenterProtocol?{get set}
    func showCategories(categories:[Category])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol CategoryListPresenterProtocol:class {
    var view: CategoryListViewProtocol? { get set }
    var interactor: CategoryListInteractorInputProtocol? { get set }
    var wireFrame: CategoryListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showCategoryDetail(forCategory category: Category)
}

protocol CategoryListInteractorInputProtocol:class {
    var presenter: CategoryListInteractorOutputProtocol?{get set}
    var localDatamanager: CategoryListLocalDataManagerInputProtocol?{get set}
    var remoteDatamanager: CategoryListRemoteDataManagerInputProtocol?{get set}
    
    func retrieveCategoryList()
}

protocol CategoryListInteractorOutputProtocol:class {
    func didRetrieveCategoryList(_categories:[Category])
     func onError()
}

protocol CategoryListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: CategoryListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveCategoryList()
}

protocol CategoryListRemoteDataManagerOutputProtocol {
    func onCategoryListRecieved(_categories:[Category])
    func onError()
}

protocol CategoryListLocalDataManagerInputProtocol{
    func retrieveCategoryList() throws -> [Category]
    func saveCategory(id: Int, name: String, product:[Product]) throws
}


protocol CategoryListWireFrameProtocol {
    static func createCategoryListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentCategoryDetailScreen(from view: CategoryListViewProtocol, forCategory category: Category)
}
