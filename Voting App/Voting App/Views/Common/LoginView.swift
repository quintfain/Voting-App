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
                ZStack(alignment: .leading) {
                    if  studentID == "" {
                        Text("  Enter StudentID")
                            .foregroundColor(Color.text)
                            
                    }
                    TextField("", text: $studentID)
                        .font(.custom("Roboto-Medium", size: 20.0))
                        .padding(.horizontal , 15)
                        .frame(height: 40.0)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.secondary))
                        .autocapitalization(.none)
                        .foregroundColor(Color.text)
                }
                ZStack(alignment: .leading) {
                    if password == "" {
                        Text("  Enter Password")
                            .foregroundColor(Color.text)
                            
                    }
                    SecureField("", text: $password)
                        .font(.custom("Roboto-Medium", size: 20.0))
                        .padding(.horizontal , 15)
                        .frame(height: 40.0)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.secondary))
                        .foregroundColor(Color.text)
                }
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
            .onAppear {
                if let data = UserDefaults.standard.data(forKey: "SavedData") {
                    if let decoded = try? JSONDecoder().decode(ViewModel.self, from: data) {
                        viewModel = decoded
                        print("decoded")
                        return
                    }
                } else {
                    if let encoded = try? JSONEncoder().encode(viewModel) {
                        UserDefaults.standard.set(encoded, forKey: "SavedData")
                        print("saved")
                    }
                }
                
            }
            .padding(.horizontal)
            .background(Color.background)
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(Color.text)
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
