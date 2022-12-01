//
//  PrivacyPolicyView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @ObservedObject var viewModel: ViewModel
    var isVoter = true
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 20)
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.title)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 20)
                Text("Privacy Agreeement")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                Text("\niVote collects personal information of users to ensure that all votes casted in a campaign are by approved members of each club or organization, and that each member only votes one time. Campaign data is not linked to personal data in any way. \n \n Do you consent to your personal data being collected for this purpose?\n ")
                    .multilineTextAlignment(.center)
                NavigationLink(destination: openHomeView(), label: {
                    Text("Agree")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                NavigationLink(destination: FullPolicyView(viewModel: viewModel), label: {
                    Text("Learn More")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.horizontal)
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func openHomeView() -> some View {
        if isVoter {
            AnyView(ElectionsView(viewModel: viewModel))
        } else {
            AnyView(OrganizerHomeView(viewModel: viewModel))
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0)
        let riley = Canidate(name: "Riley", votes: 0)
        let spencer = Canidate(name: "Spencer", votes: 0)
        let lauren = Canidate(name: "Lauren", votes: 0)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        PrivacyPolicyView(viewModel: viewModel)
    }
}
