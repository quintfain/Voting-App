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
                    .foregroundColor(.text)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.title)
                    .foregroundColor(.text)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 20)
                Text("Privacy Pledge")
                    .foregroundColor(.text)
                    .font(.custom("Roboto-Bold", size: 40.0))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                Text("\niVote collects personal information of users to ensure that all votes casted in a campaign are by approved members of each club or organization, and that each member only votes one time. Campaign data is not linked to personal data in any way. \n \nDo you consent to your personal data being collected for this purpose?\n ")
                    .foregroundColor(.text)
                    .font(.custom("Roboto-Regular", size: 16.0))
                NavigationLink(destination: openHomeView(), label: {
                    Text("Agree")
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accent)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                })
                NavigationLink(destination: FullPolicyView(viewModel: viewModel), label: {
                    Text("Learn More")
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accent.opacity(0.5))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                })
                Spacer()
            }
            .padding(.horizontal)
            .background(Color.background)
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
        let paul = Canidate(name: "Paul", votes: 0, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 0, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 0, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 0, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        PrivacyPolicyView(viewModel: viewModel)
    }
}
