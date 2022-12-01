//
//  Campaign.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/25/22.
//

import Foundation

class Campaign: Hashable, Identifiable, Codable {
    static func == (lhs: Campaign, rhs: Campaign) -> Bool {
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
    
    var campaignName: String = ""
    var id: Int
    var campaignDescription: String
    var positions: [Position]
    var hasVoted: Bool
    
    var defaultSelections: [Canidate] {
        var temp: [Canidate] = []
        for p in positions {
            temp.append(p.canidates[0])
        }
        return temp
    }

    
    init(campaignName: String, campaignDescription: String, positions: [Position], hasVoted: Bool) {
        self.campaignName = campaignName
        self.id = Campaign.generateUid()
        self.campaignDescription = campaignDescription
        self.positions = positions
        self.hasVoted = hasVoted
    }
}
