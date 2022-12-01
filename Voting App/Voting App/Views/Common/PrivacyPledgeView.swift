//
//  PrivacyPledgeView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/30/22.
//

import SwiftUI

struct PrivacyPledgeView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 20)
            Image(systemName: "checkmark.shield.fill")
                .foregroundColor(.blue)
                .font(.system(size: 200))
            Text("iVote")
                .font(.title)
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Text("Privacy Pledge")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
            Text("iVote collects personal information of users to ensure that all votes casted in a campaign are by approved members of each club or organization, and that each member only votes one time. Campaign data is not linked to personal data in any way.")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct PrivacyPledgeView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        PrivacyPledgeView(viewModel: viewModel)
    }
}
