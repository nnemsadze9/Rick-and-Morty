//
//  Character.swift
//  RickAndMortySwift
//
//  Created by User on 17.07.24.
//

import Foundation

struct PagedCharacter: Codable {
    var results: [Character]
}

struct Character: Codable {
    let name: String
    let species: String
    let gender: String
    let image: String
    let created : String
}


