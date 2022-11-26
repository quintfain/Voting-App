//
//  OrganizerHomeView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct OrganizerHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 200))
                Spacer()
                Button("Current Campaign") {
                    
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                Button("Create Campaign") {
                    
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                Spacer()
            }
        }
    }
}

struct OrganizerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerHomeView()
    }
}
