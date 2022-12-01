//
//  ElectionsView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct ElectionsView: View {
    @ObservedObject var viewModel: ViewModel
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
        
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.text)
                    .font(.system(size: 100))
                Text("iVote")
                    .font(.custom("Roboto-Bold", size: 30.0))
                    .foregroundColor(.text)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 20)
                Text("Current Campaigns")
                    .font(.custom("Roboto-Bold", size: 30.0))
                    .foregroundColor(.text)
                ForEach(viewModel.campaigns, id: \.self) { campaign in
                    NavigationLink(destination: hasVotedView(campaign: campaign)) {
                        Text("\(campaign.campaignName)")
                            .font(.custom("Roboto-Bold", size: 20.0))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accent.opacity(0.7))
                            .foregroundColor(Color.text)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                        if campaign.hasVoted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.text)
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .background(Color.background)
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
                            .foregroundColor(Color.text)
                        
                    }
                    .background(
                        NavigationLink(destination: navigateTo, isActive: $isNavigationActive) {
                            EmptyView()
                        })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    @ViewBuilder
    func hasVotedView(campaign: Campaign) -> some View {
        if campaign.hasVoted {
            ElectionStatusView(viewModel: viewModel, campaign: campaign)
        } else {
            VotingView(viewModel: viewModel, campaign: campaign)
        }
    }
}

struct ElectionsView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 40, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 30, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 30, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let quint = Canidate(name: "Quint", votes: 10, isSelected: false)
        let emma = Canidate(name: "Emma", votes: 50, isSelected: false)
        let liz = Canidate(name: "Elizabeth", votes: 30, isSelected: false)
        let tori = Canidate(name: "Tori", votes: 30, isSelected: false)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        let viewModel = ViewModel(campaigns: [campaign, campaign2])
        ElectionsView(viewModel: viewModel)
    }
}
