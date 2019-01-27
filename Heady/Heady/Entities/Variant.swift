//
//  Variant.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import CoreData

class Variant:NSObject,NSCoding {
    var id: Int!
    var name: String?
    var size: Int?
    var color: String?
    
    override init(){
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.size, forKey: "size")
        aCoder.encode(self.color, forKey: "color")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! Int
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.size = aDecoder.decodeObject(forKey: "size") as? Int
        self.color = aDecoder.decodeObject(forKey: "color") as! String?

    }
}

