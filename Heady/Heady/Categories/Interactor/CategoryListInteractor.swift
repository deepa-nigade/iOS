//
//  CategoryListInteractorProtocol.swift
//  Heady
//
//  Created by Deepa Patil on 27/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation

class CategoryListInteractor: CategoryListInteractorInputProtocol {

    weak var presenter: CategoryListInteractorOutputProtocol?
    var localDatamanager: CategoryListLocalDataManagerInputProtocol?
    var remoteDatamanager: CategoryListRemoteDataManagerInputProtocol?
    
    func retrieveCategoryList() {
        do {
            if let categoryList = try localDatamanager?.retrieveCategoryList() {
               
                if  categoryList.isEmpty {
                    remoteDatamanager?.retrieveCategoryList()
                }else{
                    presenter?.didRetrieveCategoryList(_categories: categoryList)
                }
            }
            else {
                remoteDatamanager?.retrieveCategoryList()
            }
            
        } catch {
            presenter?.didRetrieveCategoryList(_categories: [])
        }
    }
    
}

extension CategoryListInteractor: CategoryListRemoteDataManagerOutputProtocol {
    
    func onCategoryListRecieved(_categories categories: [Category]) {
        presenter?.didRetrieveCategoryList(_categories: categories)
        
        for categoryObject in categories {
            do {
                try localDatamanager?.saveCategory(id: categoryObject.category_id ?? 0, name: categoryObject.category_name ?? "", product: categoryObject.products ?? [Product]())
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
