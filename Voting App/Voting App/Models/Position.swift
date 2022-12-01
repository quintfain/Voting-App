//
//  Position.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 12/1/22.
//

import Foundation

class Position: Hashable, Identifiable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        
    }
    
    public var positionName: String
    var id: Int
    public var canidates: [Canidate]
    
    static var nextUid = 0
    static func generateUid() -> Int {
        nextUid += 1
        return nextUid
    }
        
    var totalVotes: Double {
        var votes: Double = 0.0
        for canidate in canidates {
            votes += canidate.votes
        }
        return votes
    }
    
    init(positionName: String, canidates: [Canidate]) {
        self.positionName = positionName
        self.id = Position.generateUid()
        self.canidates = canidates
    }
}
