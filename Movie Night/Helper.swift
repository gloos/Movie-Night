//
//  Helper.swift
//  Movie Night
//
//  Created by Gary on 08/11/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

func save(object: Any, key: String) {
    let savedData = NSKeyedArchiver.archivedData(withRootObject: object)
    let defaults = UserDefaults.standard
    defaults.set(savedData, forKey: key)
}
