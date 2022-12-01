//
//  CreateCampaignView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct CreateCampaignView: View {
    @State private var campaignName: String = ""
    @State private var campaignDescription: String = ""
    @State private var testPositions: String = ""
    @State private var positions: [Position] = []
    @State private var presentedAddPosition = false
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
                    }.alert("New Position", isPresented: $presentedAddPosition, actions: {
                        TextField("Position", text: $positionName)
                        Button("Add", action: {
                            var temp = Position(positionName: positionName, canidates: [])
                            positionName = ""
                            positions.append(temp)
                        })
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("Please enter the name of the position")
                    })
                }
                NavigationLink {
                    CanidatesView()
                } label: {
                    Text("Enter")
                }

            }
            .navigationTitle("Create Campaign")
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        positions.remove(atOffsets: offsets)
    }
    
    
}

struct CreateCampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaignView()
    }
}
