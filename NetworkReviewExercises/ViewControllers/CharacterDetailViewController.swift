//
//  CharacterDetailViewController.swift
//  NetworkReviewExercises
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    var selectedCharacter: Character?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBAction func SpeciesButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func filmButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func homeWorldButton(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacter()
    }
    
    func loadCharacter() {
        guard let character = selectedCharacter else {return}
            nameLabel.text = character.name
            skinColorLabel.text = "SkinColor: \(character.skin_color)"
            hairColorLabel.text = "HairColor: \(character.hair_color)"
            eyeColorLabel.text = "EyeColor: \(character.eye_color)"
            heightLabel.text = "Height: \(character.height)"
            birthLabel.text = "BirthYear: \(character.birth_year)"
            genderLabel.text = "Gender: \(character.gender)"
    }
    
}
