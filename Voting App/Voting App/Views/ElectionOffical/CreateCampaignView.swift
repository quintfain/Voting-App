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
    var body: some View {
        VStack {
            Form {
                TextField("Campaign Name", text: $campaignName)
                TextField("Campaign Description", text: $campaignDescription)
                Section("Postions") {
                    ForEach(positions, id: \.self) {
                        Text("\($0.positionName)")
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
                                        let temp = Canidate(name: testName, votes: 0)
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
                    })
                }
                NavigationLink {
                    let campaign = Campaign(campaignName: campaignName, campaignDescription: campaignDescription, positions: positions, hasVoted: false)
                    SubmitCampaignView(viewModel: viewModel, campaign: campaign)
                } label: {
                    Text("Review and Submit Campaign")
                }

            }
            .navigationTitle("Create Campaign")
        }
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
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        CreateCampaignView(viewModel: viewModel)
    }
}
