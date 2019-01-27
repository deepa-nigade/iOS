//
//  Util.swift
//  Heady
//
//  Created by Deepa Patil on 27/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import Foundation

func getStringIfPresentInJSon(dict:NSDictionary, key:String)->String{
    guard let value = dict.value(forKey: key) as? String else {
        return ""
    }
    return value
}

func getIntIfPresentInJSon(dict:NSDictionary, key:String)->Int{
    guard let value = dict.value(forKey: key) as? Int else {
        return 0
    }
    return value
}

func getArrayIfPresentInJSon(dict:NSDictionary, key:String)->NSArray?{
    guard let value = dict.value(forKey: key) as? NSArray else {
        return nil
    }
    return value
}

func getDictIfPresentInJSon(dict:NSDictionary, key:String)->NSDictionary?{
    guard let value = dict.value(forKey: key) as? NSDictionary else {
        return nil
    }
    return value
}
