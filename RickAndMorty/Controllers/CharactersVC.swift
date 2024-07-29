//
//  ViewController.swift
//  RickAndMorty
//
//  Created by User on 17.07.24.
//

import UIKit

class CharactersVC: UIViewController {
    var tableView = UITableView()
    var data = [Character]()
    var filteredData = [Character]()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearching : Bool = false
    var page : Int = 1
    var isFilterOn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        getCharacters(page: page)
        
    }
    
    private func configureTableView(){
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type text here ..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    func getCharacters(page : Int){
       let characterService = CharacterService()
        characterService.getCharacters(page: page) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.updateData(on: result)
                self.tableView.reloadData()
            }
        
        }
    }
    
    
    func updateData(on characters : [Character]){
        self.data.append(contentsOf: characters)
        filteredData = data
        tableView.reloadData()
        
    }
}




extension CharactersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = CharacterCell.Model.init(from: filteredData[indexPath.row]) 
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell else {
            let cell = CharacterCell(style: .default, reuseIdentifier: "CharacterCell")
            cell.set(character: character)
            return cell
        }
        
        cell.set(character: character)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == filteredData.count - 5, !isFilterOn {
            self.page += 1
            getCharacters(page: page)
               }
    }
}

extension CharactersVC : UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            isFilterOn = false
            filteredData = data
            tableView.reloadData()
            return
        }
        isFilterOn = true
        filteredData = data.filter { model in
            return model.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}
