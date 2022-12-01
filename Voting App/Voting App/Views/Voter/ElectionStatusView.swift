//
//  ElectionStatusView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct ElectionStatusView: View {
    @ObservedObject var viewModel: ViewModel
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    var campaign: Campaign
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(campaign.campaignName)")
                .font(.largeTitle)
            Text("\(campaign.campaignDescription)")
            Spacer()
                .frame(height: 10)
            Text("Positions")
                .font(.title)
            ForEach(0..<campaign.positions.count, id: \.self) { i in
                Text("\(campaign.positions[i].positionName)")
                    .font(.title2)
                ForEach(campaign.positions[i].canidates, id: \.self) {
                    Text("\($0.name)")
                    let percent = ($0.votes / campaign.positions[i].totalVotes) * 100
                    let formattedFloat = String(format: "%.1f", percent)
                    ProgressView("\(formattedFloat)%", value: $0.votes, total: campaign.positions[i].totalVotes)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        navigateTo = AnyView(PrivacyCenterView(viewModel: viewModel))
                        isNavigationActive = true
                    } label: {
                        Label("Privacy Center", systemImage: "person.badge.shield.checkmark")
                    }
                    Button {
                        navigateTo = AnyView(LoginView())
                        isNavigationActive = true
                    } label: {
                        Label("Logout", systemImage: "arrowshape.turn.up.backward")
                    }
                } label: {
                    Label("Menu", systemImage: "line.3.horizontal")
                    
                }
                .background(
                    NavigationLink(destination: navigateTo, isActive: $isNavigationActive) {
                        EmptyView()
                    })
            }
        }
    }
}

struct ElectionStatusView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: true)
        let quint = Canidate(name: "Quint", votes: 10)
        let emma = Canidate(name: "Emma", votes: 50)
        let liz = Canidate(name: "Elizabeth", votes: 30)
        let tori = Canidate(name: "Tori", votes: 30)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        let viewModel = ViewModel(campaigns: [campaign, campaign2])
        ElectionStatusView(viewModel: viewModel, campaign: campaign)
    }
}
