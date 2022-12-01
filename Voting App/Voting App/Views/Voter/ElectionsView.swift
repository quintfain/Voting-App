//
//  ElectionsView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct ElectionsView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                        .frame(height: 30)
                ForEach(viewModel.campaigns, id: \.self) { campaign in
                    NavigationLink(destination: hasVotedView(campaign: campaign)) {
                        Text("\(campaign.campaignName)")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                        if campaign.hasVoted {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Current Elections")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                     Menu(content: {
                         NavigationLink(destination: PrivacyCenterView()) {
                             HStack {
                                 Text("Privacy Center")
                                 Image(systemName: "person.badge.shield.checkmark")
                             }
                         }
                         NavigationLink(destination: LoginView()) {
                             HStack {
                                 Text("Logout")
                                 Image(systemName: "arrowshape.turn.up.backward")
                             }
                         }
                     }, label: {
                         HStack {
                             Image(systemName: "line.3.horizontal")
                             Text("Menu")
                         }
                     })
                  }
              }
        }
        .navigationBarBackButtonHidden(true)

    }
    
    @ViewBuilder
    func hasVotedView(campaign: Campaign) -> some View {
        if campaign.hasVoted {
            ElectionStatusView(viewModel: viewModel)
        } else {
            VotingView(viewModel: viewModel)
        }
    }
}

struct ElectionsView_Previews: PreviewProvider {
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
        ElectionsView()
    }
}
