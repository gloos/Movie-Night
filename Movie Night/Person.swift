//
//  Person.swift
//  Movie Night
//
//  Created by Gary on 24/10/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    let name: String
    let id: String
    
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String, let id = json["id"] as? Int else {
            return nil
        }
        self.name = name
        self.id = String(id)
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        id = aDecoder.decodeObject(forKey: "id") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(id, forKey: "id")
    }
}
