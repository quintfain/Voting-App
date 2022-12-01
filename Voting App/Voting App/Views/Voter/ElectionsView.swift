//
//  ElectionsView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct ElectionsView: View {
    var campaigns: [Campaign]
    var body: some View {
        NavigationView {
            VStack {
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
            .navigationTitle("Current Elections")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                     Menu(content: {
                         NavigationLink(destination: OrganizerHomeView(campaigns: campaigns)) {
                             HStack {
                                 Text("Home")
                                 Image(systemName: "house")
                                 
                             }
                         }
                         NavigationLink(destination: PrivacyCenterView()) {
                             HStack {
                                 Text("Privacy Center")
                                 Image(systemName: "person.badge.shield.checkmark")
                             }
                         }
                         NavigationLink(destination: LoginView()) {
                             HStack {
                                 Text("Logout")
                                 Image(systemName: "arrowshape.turn.up.backward")
                             }
                         }
                     }, label: {
                         HStack {
                             Image(systemName: "line.3.horizontal")
                             Text("Menu")
                         }
                     })
                  }
              }
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct ElectionsView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp])
        ElectionsView(campaigns: [campaign])
    }
}
