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
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.title)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                Spacer()
                TextField("Student ID", text: $studentID)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                NavigationLink(destination: loginButtonClicked(),  label: {
                    Text("Submit")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                Spacer()
                
            }
            .padding(.horizontal)
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func loginButtonClicked() -> some View {
        if studentID == "voter" {
            AnyView(PrivacyPolicyView(viewModel: viewModel, isVoter: true))
        } else {
            AnyView(PrivacyPolicyView(viewModel: viewModel, isVoter: false))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
