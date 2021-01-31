//
//  Player.swift
//  quizapp
//
//

import Foundation


public struct Player {
    var score: Int = 0
    var history = [Int]()

    
    mutating func updateHistory() {
        self.history.append(self.score)
    }
    
    func getTraditionalGrade() -> String {
        if self.score >= 9 {
            return "Excellent"
        } else if self.score >= 7 {
            return "Good"
        } else if self.score >= 5 {
            return "Satisfactory"
        }
        return "Fail"
    }
}
