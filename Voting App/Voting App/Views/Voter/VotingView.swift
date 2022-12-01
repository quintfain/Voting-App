//
//  VotingView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct VotingView: View {
    var campaign: Campaign
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0) {
                Spacer()
                    .frame(height: 20)
                ForEach(campaign.positions, id: \.self) { position in
                    Text("\(position.positionName)")
                    
                }
                Spacer()
            }
            .navigationTitle(campaign.campaignName)
            .padding(.horizontal)
        }
    }
}

struct VotingView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp])
        VotingView(campaign: campaign)
    }
}
