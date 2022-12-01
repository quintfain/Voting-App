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
                    .foregroundColor(.text)
                    .font(.system(size: 200))
                Text("iVote")
                    .font(.custom("Roboto-Bold", size: 40.0))
                    .foregroundColor(.text)
                    .fontWeight(.bold)
                Spacer()
                TextField("Student ID", text: $studentID)
                    .font(.custom("Roboto-Medium", size: 20.0))
                    .padding(.horizontal , 15)
                    .frame(height: 40.0)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .font(.custom("Roboto-Medium", size: 20.0))
                    .padding(.horizontal , 15)
                    .frame(height: 40.0)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                NavigationLink(destination: loginButtonClicked(),  label: {
                    Text("Submit")
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accent)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                })
                Spacer()
                
            }
            .padding(.horizontal)
            .background(Color.background)
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
