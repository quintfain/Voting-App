//
//  CurrentCampaignsView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct CurrentCampaignsView: View {
    var campaigns: [Campaign]
    var body: some View {
        VStack {
            Text("Current Campaigns")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
                .frame(height: 30)
            ForEach(campaigns, id: \.self) { campaign in
                NavigationLink(destination: ElectionStatusView(campaign: campaign)) {
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
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp])
        CurrentCampaignsView(campaigns: [campaign])
    }
}
