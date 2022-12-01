//
//  Campaign.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/25/22.
//

import Foundation

struct Campaign: Hashable {
    static func == (lhs: Campaign, rhs: Campaign) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        
    }
    var campaignName: String
    let id = UUID()
    var campaignDescription: String
    var positions: [Position]
}
struct Position: Hashable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        
    }
    
    var positionName: String
    let id = UUID()
    var canidates: [Canidate]
    var totalVotes: Int {
        var votes = 0
        for canidate in canidates {
            votes += canidate.votes
        }
        return votes
    }
       
}

struct Canidate: Hashable {
    static func == (lhs: Canidate, rhs: Canidate) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
        
    }
    var name: String
    let id = UUID()
    var votes: Int
}