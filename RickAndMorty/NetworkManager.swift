//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by User on 18.07.24.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    private let baseURL = "https://rickandmortyapi.com/api/character/?page="
    let cache = NSCache <NSString, UIImage> ()
    
    private init(){}
    
    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(nil, error)
                   return
               }
               completion(data, nil)
           }
           task.resume()
       }
    
}
