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
    @State private var positions: [String] = []
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Campaign Name", text: $campaignName)
                TextField("Campaign Description", text: $campaignDescription)
                Section("Postions") {
                    Button("Add Position") {
                        
                    }
                }
                Button("Enter") {
                    
                }
            }
            .navigationTitle("Create Campaign")
        }
    }
}

struct CreateCampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaignView()
    }
}
