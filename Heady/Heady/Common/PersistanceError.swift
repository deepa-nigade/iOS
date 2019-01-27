//
//  PersistanceError.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation

enum PersistanceError:Error{
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
