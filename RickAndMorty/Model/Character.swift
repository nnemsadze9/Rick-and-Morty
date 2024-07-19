//
//  Character.swift
//  RickAndMorty
//
//  Created by User on 17.07.24.
//

import Foundation

struct Character : Codable{
    var image : String
    var name : String
    var species : String
    var gender : String
    var created : String
    
    init(image: String, name: String, species: String, gender: String, created: String) {
        self.image = image
        self.name = name
        self.species = species
        self.gender = gender
        self.created = created
    }
}
