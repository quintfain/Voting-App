//
//  OrganizerHomeView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct OrganizerHomeView: View {
    var campaigns: [Campaign]
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                NavigationLink(destination: CurrentCampaignsView(campaigns: campaigns), label: {
                    Text("Current Campaigns")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                NavigationLink(destination: CreateCampaignView(),
                    label: {
                    Text("Create Campaign")
                        .font(.title3)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                     Menu(content: {
                         NavigationLink(destination: OrganizerHomeView(campaigns: campaigns)) {
                             HStack {
                                 Text("Home")
                                 Image(systemName: "house")
                                 
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

struct OrganizerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp])
        OrganizerHomeView(campaigns: [campaign])
    }
}
