//
//  ViewController.swift
//  NetworkReviewExercises
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    var characters = [Character](){
        didSet {
            self.tableView.reloadData()
            print(characters)
        }
    }
    var searchTerm = "" {
        didSet {
            loadCharacters()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        tableView.delegate = self; tableView.dataSource = self
        searchBar.delegate = self
        super.viewDidLoad()
    }
    
    func loadCharacters() {
        let url = "https://swapi.co/api/people/?search=\(searchTerm)"
        let completion: ([Character]) -> Void = {(onlineCharacter: [Character]) in
            self.characters = onlineCharacter
            self.tableView.setNeedsLayout()
        }
        CharacterAPIClient.manager.getShows(from: url, completionHandler: completion, errorHandler: {print($0)})
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterDetailViewController {
            destination.selectedCharacter = characters[tableView.indexPathForSelectedRow!.row]
        }
    }
}
extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        characterCell.textLabel?.text = character.name
        characterCell.detailTextLabel?.text = character.gender
        return characterCell
    }
}
extension CharacterViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = searchBar.text ?? ""
        searchBar.resignFirstResponder()
    }
}
