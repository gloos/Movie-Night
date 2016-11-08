//
//  PopularPeopleTableViewController.swift
//  Movie Night
//
//  Created by Gary on 08/11/2016.
//  Copyright © 2016 gloos. All rights reserved.
//


import UIKit

class PopularPeopleTableViewController: UITableViewController {
    
    var people: [Person] = []
    var selectedPeople: [Person] = []
    var voter = 1
    
    override func viewDidLoad() {
        getPopularPeople()
    }
    
    func getPopularPeople() {
        MovieDBAPIClient().getPeople { (result) in
            
            switch result {
            case .Success(let results):
                self.people = results
                self.tableView.reloadData()
            case .Failure(let error):
                print(error)
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell") as UITableViewCell
        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath), cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            self.selectedPeople.append(people[indexPath.row])
            save(object: self.selectedPeople, key: "people\(self.voter)")
        } else if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            self.selectedPeople = self.selectedPeople.filter {$0.name != people[indexPath.row].name }
            save(object: self.selectedPeople, key: "people\(self.voter)")
        }
        print(selectedPeople)
    }
    

    
    
}

