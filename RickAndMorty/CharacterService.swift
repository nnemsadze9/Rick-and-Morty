//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by User on 29.07.24.
//

import Foundation

struct CharacterService{
    private let baseURL = "https://rickandmortyapi.com/api/character/?page="
    
    public func getCharacters(page : Int, completed : @escaping ([Character]) -> Void ){
        let endpoint = baseURL + "\(page)"
        print(endpoint)
        guard let url = URL(string: endpoint) else {return}
        
        NetworkManager.shared.fetchData(from: url) { data, error in
            if let _ = error {
                return
            }
            guard let data = data else { return }
            do {
                let characters = try JSONDecoder().decode(PagedCharacter.self, from: data).results
                completed(characters)
            } catch {
                return
            }
        }
    }
}
