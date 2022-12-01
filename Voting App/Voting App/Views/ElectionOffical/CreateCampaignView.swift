//
//  CreateCampaignView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct CreateCampaignView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var campaignName: String = ""
    @State private var campaignDescription: String = ""
    @State private var testPositions: String = ""
    @State private var testName: String = ""
    @State private var positions: [Position] = []
    @State private var tempCanidates: [Canidate] = []
    @State private var presentedAddPosition = false
    @State private var presentedAddCanidate = false
    @State private var positionName = ""
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    var body: some View {
        VStack {
            Text("Create Campaign")
                .font(.custom("Roboto-Bold", size: 30.0))
                .foregroundColor(.text)
            Form {
                ZStack(alignment: .leading) {
                    if campaignName == "" {
                        Text("Campaign name")
                            .foregroundColor(Color.text)
                            
                    }
                    TextField("Campaign Name", text: $campaignName)
                        .foregroundColor(Color.text)
                }
                .listRowBackground(Color.sec)
                ZStack(alignment: .leading) {
                    if campaignDescription == "" {
                        Text("Campaign description")
                            .foregroundColor(Color.text)
                            
                    }
                    TextField("Campaign Description", text: $campaignDescription)
                        .foregroundColor(Color.text)
                }
                .listRowBackground(Color.sec)
                Section("Postions") {
                    ForEach(positions, id: \.self) {
                        Text("\($0.positionName)")
                            .foregroundColor(Color.text)
                    }.onDelete(perform: removeRows)
                    Button("Add Position") {
                        presentedAddPosition = true
                    }.sheet(isPresented: $presentedAddPosition, content: {
                        Form {
                            Section {
                                TextField("Position Name", text: $testPositions)
                            }
                            Section("Canidates") {
                                ForEach(tempCanidates, id: \.self) {
                                    Text("\($0.name)")
                                }.onDelete(perform: removeCanidate)
                                Button("Add Canidate") {
                                    presentedAddCanidate = true
                                }
                                .alert("Add Canidate", isPresented: $presentedAddCanidate, actions: {
                                    TextField("Canidate Name", text: $testName)
                                    Button("Add", action: {
                                        let temp = Canidate(name: testName, votes: 0, isSelected: false)
                                        tempCanidates.append(temp)
                                        testName = ""
                                    })
                                    Button("Cancel", role: .cancel, action: {})
                                }, message: {
                                    Text("Please enter the name of the canidate")
                                })
                            }
                            Button{
                                presentedAddPosition = false
                                let temp = Position(positionName: testPositions, canidates: tempCanidates)
                                positions.append(temp)
                                tempCanidates = []
                                testPositions = ""
                            } label: {
                                Text("Add Position")
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal)
                        .background(Color.background)
                    })
                }.listRowBackground(Color.sec)
                NavigationLink {
                    let campaign = Campaign(campaignName: campaignName, campaignDescription: campaignDescription, positions: positions, hasVoted: false)
                    SubmitCampaignView(viewModel: viewModel, campaign: campaign)
                } label: {
                    Text("Review and Submit Campaign")
                        .font(.custom("Roboto-Bold", size: 16))
                        .padding()
                        .foregroundColor(Color.text)
                }.listRowBackground(Color.sec)

            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .foregroundColor(Color.text)
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
        .background(Color.background)
    }
    
    func removeRows(at offsets: IndexSet) {
        positions.remove(atOffsets: offsets)
    }
    
    func removeCanidate(at offsets: IndexSet) {
        tempCanidates.remove(atOffsets: offsets)
    }
    
    
}

struct CreateCampaignView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 0, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 0, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 0, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        CreateCampaignView(viewModel: viewModel)
    }
}
