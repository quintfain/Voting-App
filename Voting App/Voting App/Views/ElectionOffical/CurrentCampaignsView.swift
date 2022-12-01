//
//  CurrentCampaignsView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct CurrentCampaignsView: View {
    @ObservedObject var viewModel: ViewModel
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Current Campaigns")
                    .font(.custom("Roboto-Bold", size: 30.0))
                    .foregroundColor(.text)
                Spacer()
                    .frame(height: 30)
                ForEach(viewModel.campaigns, id: \.self) { campaign in
                    NavigationLink(destination: ElectionStatusView(viewModel: viewModel, campaign: campaign)) {
                        Text("\(campaign.campaignName)")
                            .font(.custom("Roboto-Bold", size: 20.0))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accent.opacity(0.7))
                            .foregroundColor(Color.text)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                    }
                }
                Spacer()
            }
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
}

struct CurrentCampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 0, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 0, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 0, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        CurrentCampaignsView(viewModel: viewModel)
    }
}
