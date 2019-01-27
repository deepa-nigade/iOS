//
//  Product.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import CoreData

class Product :NSObject,NSCoding{
    
    override init(){
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.variants, forKey: "variants")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.variants = aDecoder.decodeObject(forKey: "variants") as? [Variant]
    }
    
    var id: Int!
    var name: String?
    var variants: [Variant]?
    
}
