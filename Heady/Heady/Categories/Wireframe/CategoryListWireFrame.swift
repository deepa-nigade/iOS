//
//  CategoryListWireFrame.swift
//  Heady
//
//  Created by Deepa Patil on 27/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import UIKit

class CategoryListWireFrame: CategoryListWireFrameProtocol {
   
    
    static func createCategoryListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "categoryNavigationController")
        if let view = navController.children.first as? CategoryListView{
            let presenter:CategoryListPresenterProtocol & CategoryListInteractorOutputProtocol = CategoryListPresenter()
            let interactor:CategoryListInteractorInputProtocol & CategoryListRemoteDataManagerOutputProtocol = CategoryListInteractor()
            let wireframe:CategoryListWireFrameProtocol = CategoryListWireFrame()
            let localDatamanger:CategoryListLocalDataManagerInputProtocol = CategoryListLocalDataManager()
            let remoteDataMaanger:CategoryListRemoteDataManagerInputProtocol = CategoryListRemoteDataManager()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireframe
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDatamanger
            interactor.remoteDatamanager = remoteDataMaanger
            remoteDataMaanger.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    func presentCategoryDetailScreen(from view: CategoryListViewProtocol, forCategory category: Category) {
        
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
