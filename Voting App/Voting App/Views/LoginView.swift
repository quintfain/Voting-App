//
//  LoginView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct LoginView: View {
    @State private var password: String = ""
    @State private var studentID: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark.shield.fill")
                .foregroundColor(.blue)
                .font(.system(size: 200))
            Spacer()
            TextField("Student ID", text: $studentID)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
                loginButtonClicked()
            } label: {
                Text("Submit")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            Spacer()

        }
        .padding(.horizontal)
        .background(Color(.systemGroupedBackground))
    }
    
    func loginButtonClicked() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
