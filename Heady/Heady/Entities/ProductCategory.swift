//
//  Category.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation
import CoreData

class Category:NSObject {
      var category_id: Int?
      var category_name: String?
      var products: [Product]?
}

