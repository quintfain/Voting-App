//
//  PrivacyCenterView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyCenterView: View {
    var body: some View {
        NavigationView {
            Form {
                Section("iVote Privacy") {
                    NavigationLink(destination: PrivacyPledgeView()) {
                        Text("Privacy Pledge")
                    }
                    NavigationLink(destination: FullPolicyView()) {
                        Text("Privacy Policy")
                    }
                }
                Section("Your Data") {
                    Button("Aggregate Data") {
                        
                    }
                    Button("Access My Data") {
                        
                    }
                    Button("Delete My Data") {
                        
                    }
                }
            }
            .navigationTitle("Privacy Center")
        }
    }
}

struct PrivacyCenterView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyCenterView()
    }
}
