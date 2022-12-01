//
//  SubmitCampaignView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct SubmitCampaignView: View {
    @ObservedObject var viewModel: ViewModel
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    var campaign: Campaign
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
                .frame(height: 20)
            Text("\(campaign.campaignName)")
                .font(.largeTitle)
            Text("\(campaign.campaignDescription)")
            Spacer()
                .frame(height: 10)
            Text("Positions")
                .font(.title)
            ForEach(campaign.positions) {
                Text("\($0.positionName)")
                    .font(.title2)
                ForEach($0.canidates, id: \.self) {
                    Text("\($0.name)")
                    ProgressView("0%", value: 0, total: 100)
                }
            }
            NavigationLink(destination: OrganizerHomeView(viewModel: viewModel).onAppear {
                viewModel.campaigns.append(campaign)
            }, label: {
                Text("Submit Campaign")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
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

struct SubmitCampaignView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        
        let quint = Canidate(name: "Quint", votes: 10)
        let emma = Canidate(name: "Emma", votes: 50)
        let liz = Canidate(name: "Elizabeth", votes: 30)
        let tori = Canidate(name: "Tori", votes: 30)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        SubmitCampaignView(viewModel: viewModel, campaign: campaign2)
    }
}
