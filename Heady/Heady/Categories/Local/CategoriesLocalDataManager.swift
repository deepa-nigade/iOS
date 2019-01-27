//
//  CategoriesLocalDataManager.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import CoreData


class CategoryListLocalDataManager:CategoryListLocalDataManagerInputProtocol{
    
    
    func retrieveCategoryList() throws -> [Category]{
        guard let managedOC = CoreDataStore.managedObjectContext else{
            throw PersistanceError.managedObjectContextNotFound
        }
        var categoryList = [Category]()
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "ProductCategory")
        
        //3
        do {
            
            let savedData = try managedOC.fetch(fetchRequest)
            
            print("found \(savedData.count) events in DB")
            
            for objCategory in savedData {
                let category = Category()
                category.category_id = objCategory.value(forKey: "category_id") as? Int
                category.category_name = objCategory.value(forKey: "category_name") as? String
                if let data = objCategory.value(forKey: "products") as? Data{
                
                    let products = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Product]
                    
                    category.products  = products
               
                }
                categoryList.append(category)

            }
           
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            throw PersistanceError.objectNotFound
        }
        
      return categoryList
        
    }
    
    
    func saveCategory(id: Int, name: String, product products:[Product]) throws{
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistanceError.managedObjectContextNotFound
        }
        
        if let newCategory = NSEntityDescription.entity(forEntityName: "ProductCategory",in: managedOC) {
            let category = NSManagedObject(entity: newCategory,
                                          insertInto: managedOC)
            category.setValue(id, forKey: "category_id")
            category.setValue(name, forKey: "category_name")
            let data = NSKeyedArchiver.archivedData(withRootObject: products)
            category.setValue(data, forKeyPath: "products")
            
            try managedOC.save()
        }
        throw PersistanceError.couldNotSaveObject
    }
}
