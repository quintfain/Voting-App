//
//  VotingView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct VotingView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State private var currentVotes: [Canidate] = []
    @State private var showVotingSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Campaign Name")
                .font(.largeTitle)
            Text("Campaign Desctiption")
            Spacer()
                .frame(height: 10)
            Text("Positions")
                .font(.title)
            NavigationLink(destination: ElectionsView(), label: {
                Text("Submit Votes")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle("test")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
    }
}

struct VotingView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let quint = Canidate(name: "Quint", votes: 10)
        let emma = Canidate(name: "Emma", votes: 50)
        let liz = Canidate(name: "Elizabeth", votes: 30)
        let tori = Canidate(name: "Tori", votes: 30)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        let viewModel = ViewModel(campaigns: [campaign, campaign2])
        VotingView(viewModel: viewModel)
    }
}
