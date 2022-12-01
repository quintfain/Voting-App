//
//  PrivacyPolicyView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyPolicyView: View {
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
                NavigationLink(destination: FullPolicyView(), label: {
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
            AnyView(ElectionsView())
        } else {
            AnyView(OrganizerHomeView())
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
