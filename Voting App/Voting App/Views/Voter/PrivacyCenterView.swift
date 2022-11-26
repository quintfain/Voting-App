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
                    Button("Privacy Policy") {
                        
                    }
                    Button("Privacy Pledge") {
                        
                    }
                }
                Section("Your Data") {
                    Button("Aggregate Data") {
                        
                    }
                    Button("Acess My Data") {
                        
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
