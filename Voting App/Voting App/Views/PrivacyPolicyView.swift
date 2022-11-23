//
//  PrivacyPolicyView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Privacy Policy")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
            Text("Placeholder")
            Button {
                agreeToPolicy()
            } label: {
                Text("Agree")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            Button {
                openFullPolicy()
            } label: {
                Text("Learn More")
                    .font(.title2)
            }
            .buttonStyle(.bordered)
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    func openFullPolicy() {
        
    }
    
    func agreeToPolicy() {
        
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
