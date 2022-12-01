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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(campaign.campaignName)")
                    .font(.custom("Roboto-Bold", size: 40.0))
                    .foregroundColor(Color.text)
                Text("\(campaign.campaignDescription)")
                    .font(.custom("Roboto-Medium", size: 18.0))
                    .foregroundColor(Color.text)
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
                            let percent = ($0.votes / campaign.positions[i].totalVotes) * 100
                            let formattedFloat = String(format: "%.1f", percent)
                            ProgressView("\(percent.isNaN ? "0.0" : formattedFloat)%", value: $0.votes, total: campaign.positions[i].totalVotes > 0 ? campaign.positions[i].totalVotes : 100)
                                .foregroundColor(Color.text)
                                .tint(Color.text)
                        }
                        Spacer()
                            .frame(height: 5)
                    }.padding(.all).background (RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.sec))
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(Color.background.ignoresSafeArea())
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
        .background(Color.background.ignoresSafeArea())
        
    }
}

struct ElectionStatusView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 40, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 30, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 30, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: true)
        let quint = Canidate(name: "Quint", votes: 10, isSelected: false)
        let emma = Canidate(name: "Emma", votes: 50, isSelected: false)
        let liz = Canidate(name: "Elizabeth", votes: 30, isSelected: false)
        let tori = Canidate(name: "Tori", votes: 30, isSelected: false)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        let viewModel = ViewModel(campaigns: [campaign, campaign2])
        ElectionStatusView(viewModel: viewModel, campaign: campaign)
    }
}
