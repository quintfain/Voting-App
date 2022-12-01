//
//  TestData.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/30/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var campaigns: [Campaign]
    
    init() {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
        let pres = Position(positionName: "President", canidates: [paul, riley])
        let vp = Position(positionName: "Vice President", canidates: [spencer, lauren])
        let campaign1 = Campaign(campaignName: "SGA Elections", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        
        let quint = Canidate(name: "Quint", votes: 10)
        let emma = Canidate(name: "Emma", votes: 50)
        let liz = Canidate(name: "Elizabeth", votes: 30)
        let tori = Canidate(name: "Tori", votes: 30)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        
        self.campaigns = [campaign1, campaign2]
    }
    
    init(campaigns: [Campaign]) {
        self.campaigns = campaigns
    }
}
