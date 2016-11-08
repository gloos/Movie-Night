//
//  ViewController.swift
//  Movie Night
//
//  Created by Gary Luce on 12/10/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        print("Attempting to open data")
        if let savedPeople = defaults.object(forKey: "people") as? Data {
            print("Attemping to load people")
            let people = NSKeyedUnarchiver.unarchiveObject(with: savedPeople) as! [Person]
            print("people: \(people)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

