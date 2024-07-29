//
//  CharacterCellModel.swift
//  RickAndMorty
//
//  Created by User on 23.07.24.
//

import Foundation

extension CharacterCell{
    struct Model{
        let nameText : String
        let speciesText : String
        let genderText : String
        let createdText : String
        let imageNameText : String
        
        init(from character : Character){
            nameText = character.name
            speciesText = character.species
            genderText = character.gender
            createdText = character.created
            imageNameText = character.image
        }
    }
}
