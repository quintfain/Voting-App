//
//  ElectionStatusView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct ElectionStatusView: View {
    var campaign: Campaign
    
    var body: some View {
        VStack {
            ProgressBar(value: 0.1)
                .frame(height: 20)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu(content: {
                    NavigationLink(destination: OrganizerHomeView(campaigns: TestData().campaigns)) {
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
}

struct ElectionStatusView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20)
        let riley = Canidate(name: "Riley", votes: 40)
        let spencer = Canidate(name: "Spencer", votes: 30)
        let lauren = Canidate(name: "Lauren", votes: 30)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp])
        ElectionStatusView(campaign: campaign)
    }
}
