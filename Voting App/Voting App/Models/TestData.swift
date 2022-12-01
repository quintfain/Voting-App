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
        let paul = Canidate(name: "Paul", votes: 20, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 40, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 30, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 30, isSelected: false)
        let pres = Position(positionName: "President", canidates: [paul, riley])
        let vp = Position(positionName: "Vice President", canidates: [spencer, lauren])
        let campaign1 = Campaign(campaignName: "SGA Elections", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        
        let quint = Canidate(name: "Quint", votes: 10, isSelected: false)
        let emma = Canidate(name: "Emma", votes: 50, isSelected: false)
        let liz = Canidate(name: "Elizabeth", votes: 30, isSelected: false)
        let tori = Canidate(name: "Tori", votes: 30, isSelected: false)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        
        self.campaigns = [campaign1, campaign2]
    }
    
    init(campaigns: [Campaign]) {
        self.campaigns = campaigns
    }
}
