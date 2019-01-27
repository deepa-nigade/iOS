//
//  CategoryListRemoteDataManager.swift
//  Heady
//
//  Created by Deepa Patil on 27/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation


/// This class is used to retrieve data from the website
class CategoryListRemoteDataManager: CategoryListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: CategoryListRemoteDataManagerOutputProtocol?
    
    func retrieveCategoryList() {
        let dataTask = URLSession.shared.dataTask(with: URL(string:APPURLS.getCategories)!) { (data, response, error) in
            guard error == nil else{
                self.remoteRequestHandler?.onError()
                return
            }
            if let httpResponse = response as? HTTPURLResponse{
               if httpResponse.statusCode == 200{
                do {
                    if let jsonDictionary: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary{
                    
                    self.remoteRequestHandler?.onCategoryListRecieved(_categories: self.getCategoryList(jsonDict: jsonDictionary))
                    return
                }
                    self.remoteRequestHandler?.onError()
                    return
                }
                catch{
                    
                    print("error !!!")
                    self.remoteRequestHandler?.onError()
                    return
                }
            }
                
            }
           
        }
        dataTask.resume()
    }
    
    func getCategoryList(jsonDict:NSDictionary) -> [Category]{
        var categories = [Category]()
       
        if let catArray = getArrayIfPresentInJSon(dict: jsonDict, key: "categories") as? [NSDictionary]{
            for dict in catArray{
                let category = Category()
                category.category_id = getIntIfPresentInJSon(dict: dict, key: "id")
                category.category_name = getStringIfPresentInJSon(dict: dict, key: "name")
                category.products = getProducts(dict: dict)
                categories.append(category)
            }
        }
        return categories
    }
    
    func getProducts(dict:NSDictionary) -> [Product]{
        var productsList = [Product]()
        if let productsArr = getArrayIfPresentInJSon(dict: dict, key: "products") as? [NSDictionary]{
            
            for objProduct in productsArr{
                let product = Product()
                product.id =  getIntIfPresentInJSon(dict: objProduct, key: "id")
                product.name = getStringIfPresentInJSon(dict: objProduct, key: "name")
                product.variants = getVariants(dict: dict)
                productsList.append(product)
            }
        }
        return productsList

    }
    
    func getVariants(dict:NSDictionary) -> [Variant]{
        var variantsList = [Variant]()
        if let variantsArr = getArrayIfPresentInJSon(dict: dict, key: "variants") as? [NSDictionary]{
            
            for objVariant in variantsArr{
                let variant = Variant()
                variant.size = getIntIfPresentInJSon(dict: objVariant, key: "id")
                variant.color = getStringIfPresentInJSon(dict: objVariant, key: "name")

                variantsList.append(variant)
            }
        }
        return variantsList
        
    }

}
