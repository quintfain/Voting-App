//
//  PrivacyCenterView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyCenterView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Form {
            Section("iVote Privacy") {
                NavigationLink(destination: PrivacyPledgeView(viewModel: viewModel)) {
                    Text("Privacy Pledge")
                }
                NavigationLink(destination: FullPolicyView(viewModel: viewModel)) {
                    Text("Privacy Policy")
                }
            }
            Section("Your Data") {
                Button("Aggregate Data") {
                    
                }
                Button("Access My Data") {
                    
                }
                Button("Delete My Data") {
                    
                }
            }
        }
        .navigationTitle("Privacy Center")
    }
}

struct PrivacyCenterView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
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
        PrivacyCenterView(viewModel: viewModel)
    }
}
