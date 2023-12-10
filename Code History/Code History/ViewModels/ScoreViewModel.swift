//
//  ScoreViewModel.swift
//  Code History
//
//  Created by pitel on 9/19/23.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
       ( correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
