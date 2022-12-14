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
                .font(.custom("Roboto-Bold", size: 40.0))
                .foregroundColor(.text)
            Text("\(campaign.campaignDescription)")
                .font(.custom("Roboto-Medium", size: 16.0))
                .foregroundColor(.text)
            Spacer()
                .frame(height: 10)
            Text("Positions")
                .font(.custom("Roboto-Bold", size: 30.0))
                .foregroundColor(Color.text)
            ForEach(0..<campaign.positions.count, id: \.self) { i in
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(campaign.positions[i].positionName)")
                        .font(.custom("Roboto-Medium", size: 24.0))
                        .foregroundColor(Color.text)
                    ForEach(campaign.positions[i].canidates, id: \.self) {
                        Text("\($0.name)")
                            .font(.custom("Roboto-Medium", size: 16.0))
                            .foregroundColor(Color.text)
                        ProgressView("0%", value: 0, total: 100)
                            .foregroundColor(Color.text)
                            .tint(Color.text)
                    }
                }.padding(.all).background (RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.sec))
            }
            NavigationLink(destination: OrganizerHomeView(viewModel: viewModel)
            .onAppear {
                viewModel.campaigns.append(campaign)
            }, label: {
                Text("Submit Campaign")
                    .font(.custom("Roboto-Bold", size: 20.0))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accent.opacity(0.7))
                    .foregroundColor(Color.text)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            })
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
                        .font(.custom("Roboto-Regular", size: 26.0))
                    
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
        let paul = Canidate(name: "Paul", votes: 0, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 0, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 0, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 0, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        
        let quint = Canidate(name: "Quint", votes: 10, isSelected: false)
        let emma = Canidate(name: "Emma", votes: 50, isSelected: false)
        let liz = Canidate(name: "Elizabeth", votes: 30, isSelected: false)
        let tori = Canidate(name: "Tori", votes: 30, isSelected: false)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        SubmitCampaignView(viewModel: viewModel, campaign: campaign2)
    }
}
