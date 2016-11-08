//
//  MovieDBClient.swift
//  Movie Night
//
//  Created by Gary on 14/10/2016.
//  Copyright © 2016 gloos. All rights reserved.
//

import Foundation

private let apiKey = "855e8f1b32c3170bc277aca309bb6887"

enum RequestTypes {
    case PopularPeople
    case MoviesForPerson
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    func completeURLWithPerson(id: Int?) -> URL {
        switch self {
        case .PopularPeople:
            return URL(string: "\(baseURL)/person/popular?api_key=\(apiKey)")!
        case .MoviesForPerson:
            return URL(string: "\(baseURL)/person/\(id)?api_key=\(apiKey)&append_to_response=credits")!
        }
    }
    
}

final class MovieDBAPIClient: APIClient {
    internal func fetch<T : JSONDecodable>(request: URLRequest, parse: ([String : AnyObject]) -> T?, completion: (APIResult<T>) -> Void) {
        
    }

    

    var configuration: URLSessionConfiguration
    var session: URLSession {
        return URLSession(configuration: self.configuration)
    }
    init (configuration: URLSessionConfiguration) {
        self.configuration = configuration
    }
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getPeople(completion: @escaping (APIResult<[Person]>) -> Void) {
        let request = URLRequest(url: RequestTypes.PopularPeople.completeURLWithPerson(id: nil))
        var testArray: [Person] = []
        fetch(request: request, parse: { json -> [Person] in
            
            if let results = json["results"] as? [[String: AnyObject]] {
                for person in results {
                    if let pers = Person(json: person) {
                        testArray.append(pers)
                    }
                }
                
                
            }
            return testArray
            
            }, completion: completion)
    }
}
