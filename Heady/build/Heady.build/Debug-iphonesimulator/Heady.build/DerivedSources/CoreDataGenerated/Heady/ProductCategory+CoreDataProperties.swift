//
//  ProductCategory+CoreDataProperties.swift
//  
//
//  Created by Deepa Patil on 27/01/19.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ProductCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductCategory> {
        return NSFetchRequest<ProductCategory>(entityName: "ProductCategory")
    }

    @NSManaged public var category_id: Int64
    @NSManaged public var category_name: String?
    @NSManaged public var products: Data?

}
