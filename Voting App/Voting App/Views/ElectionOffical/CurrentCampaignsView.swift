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
        VStack {
            Text("Current Campaigns")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
                .frame(height: 30)
            ForEach(viewModel.campaigns, id: \.self) { campaign in
                NavigationLink(destination: ElectionStatusView(viewModel: viewModel, campaign: campaign)) {
                    Text("\(campaign.campaignName)")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                }
                .buttonStyle(.bordered)
            }
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
}

struct CurrentCampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        CurrentCampaignsView(viewModel: viewModel)
    }
}
