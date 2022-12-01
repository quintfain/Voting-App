//
//  OrganizerHomeView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct OrganizerHomeView: View {
    @ObservedObject var viewModel: ViewModel
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                NavigationLink(destination: CurrentCampaignsView(viewModel: viewModel), label: {
                    Text("Current Campaigns")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                NavigationLink(destination: CreateCampaignView(viewModel: viewModel),
                    label: {
                    Text("Create Campaign")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                Spacer()
            }
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
        .navigationBarBackButtonHidden(true)
    }
}

struct OrganizerHomeView_Previews: PreviewProvider {
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
        OrganizerHomeView(viewModel: viewModel)
    }
}
