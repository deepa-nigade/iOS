//
//  CategoryListPresenter.swift
//  Heady
//
//  Created by Deepa Patil on 27/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation

class CategoryListPresenter: CategoryListPresenterProtocol {
    var wireFrame: CategoryListWireFrameProtocol?
    
    weak var view: CategoryListViewProtocol?
    var interactor: CategoryListInteractorInputProtocol?
    var wireframe: CategoryListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveCategoryList()
    }
    
    func showCategoryDetail(forCategory category:Category){
        wireframe?.presentCategoryDetailScreen(from: view!, forCategory: category)
    }
}

extension CategoryListPresenter:CategoryListInteractorOutputProtocol{
    func didRetrieveCategoryList(_categories: [Category]) {
        view?.hideLoading()
        view?.showCategories(categories: _categories)
    
    }
    
    func onError() {
        view?.showError()
    }
    
    
}
