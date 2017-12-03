//
//  CharacterAPIClient.swift
//  NetworkReviewExercises
//
//  Created by C4Q on 12/1/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct CharacterAPIClient {
    private init() {}
    static let manager = CharacterAPIClient()
    func getShows(from urlStr: String, completionHandler: @escaping ([Character]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let characterInfo = try JSONDecoder().decode(CharacterInfo.self, from: data)
                completionHandler(characterInfo.results)
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

