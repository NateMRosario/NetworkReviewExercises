//
//  Character.swift
//  NetworkReviewExercises
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct CharacterInfo: Codable {
    let results: [Character]
}
struct Character: Codable {
    let name: String
    let height: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
}

