//
//  VotingView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct VotingView: View {
    @ObservedObject var viewModel: ViewModel
    var campaign: Campaign
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    @State private var campaignSelect: [Int] = Array(repeating: 1, count: 100)
    @State private var showVotingSheet: Bool = false
    
    var body: some View {
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
                    Picker("Pick a language", selection: $campaignSelect[i]) {
                        ForEach(campaign.positions[i].canidates, id: \.self) { can in
                            Text("\(can.name)").tag(can.id)
                                .font(.custom("Roboto-Bold", size: 40.0))
                                .foregroundColor(Color.text)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                        .frame(height: 5)
                }.padding(.all).background (RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.sec))
                
            }
            NavigationLink(destination: ElectionsView(viewModel: viewModel)
            .onAppear {
                let index = viewModel.campaigns.firstIndex(where: { $0.id == campaign.id})
                for i in 0..<campaignSelect.count {
                    let index2 = viewModel.campaigns[index!].positions[i].canidates.firstIndex(where: {$0.id == campaignSelect[i]})
                    viewModel.campaigns[index!].positions[i].canidates[index2!].votes += 1
                }
                viewModel.campaigns[index!].hasVoted = true
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
        .navigationTitle("test")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .background(Color.background)
        .onAppear {
            var temp: [Int] = []
            for p in campaign.positions {
                temp.append(p.canidates[0].id)
            }
            campaignSelect = temp
        }
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

struct VotingView_Previews: PreviewProvider {
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
        VotingView(viewModel: viewModel, campaign: campaign)
    }
}
