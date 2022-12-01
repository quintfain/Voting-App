//
//  Canidate.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 12/1/22.
//

import Foundation

class Canidate: Hashable, Identifiable, Codable {
    var name: String = ""
    var id: Int
    var votes: Double
    var isSelected: Bool
    
    static func == (lhs: Canidate, rhs: Canidate) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        
    }
    static var nextUid = 0
    
    static func generateUid() -> Int {
        nextUid += 1
        return nextUid
    }
    
    init(name: String, votes: Double, isSelected: Bool) {
        self.name = name
        self.id = Canidate.generateUid()
        self.votes = votes
        self.isSelected = isSelected
    }
}
