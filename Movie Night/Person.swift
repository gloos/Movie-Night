//
//  Person.swift
//  Movie Night
//
//  Created by Gary on 24/10/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let id: String
}

extension Person {
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String, let id = json["id"] as? Int else {
            return nil
        }
        self.name = name
        self.id = String(id)
    }
}
