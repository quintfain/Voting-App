//
//  PrivacyCenterView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/22/22.
//

import SwiftUI

struct PrivacyCenterView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var presentedMyData = false
    @State private var presentedDeleteData = false
    
    var body: some View {
        VStack {
            Text("Privacy Center")
                .font(.custom("Roboto-Bold", size: 30.0))
                .foregroundColor(.text)
            Form {
                Section("iVote Privacy") {
                    NavigationLink(destination: PrivacyPledgeView(viewModel: viewModel)) {
                        Text("Privacy Pledge")
                            .font(.custom("Roboto-Medium", size: 16.0))
                    }
                    NavigationLink(destination: FullPolicyView(viewModel: viewModel)) {
                        Text("Privacy Policy")
                            .font(.custom("Roboto-Medium", size: 16.0))
                    }
                }.listRowBackground(Color.sec)
                Section("Your Data") {
                    Button("Access My Data") {
                        presentedMyData = true
                    } .sheet(isPresented: $presentedMyData, content: {
                        ZStack {
                            Color.background.edgesIgnoringSafeArea(.all)
                            VStack {
                                Spacer()
                                    .frame(height: 20)
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(.text)
                                    .font(.system(size: 100))
                                Text("iVote")
                                    .font(.custom("Roboto-Bold", size: 30.0))
                                    .foregroundColor(.text)
                                    .fontWeight(.bold)
                                Spacer()
                                    .frame(height: 20)
                                Text("iVote works to ensure your privacy by collecting minimal data. We have the following data associated with this account. This data is never associated with your vote or voting history.\n\n studentID: voter")
                                    .foregroundColor(.text)
                                    .font(.custom("Roboto-Regular", size: 16.0))
                                Spacer()
                            }
                        }
                    })
                    Button("Delete My Data") {
                        presentedDeleteData = true
                    } .sheet(isPresented: $presentedDeleteData, content: {
                        ZStack {
                            Color.background.edgesIgnoringSafeArea(.all)
                            VStack {
                                Spacer()
                                    .frame(height: 20)
                                Image(systemName: "checkmark.shield.fill")
                                    .foregroundColor(.text)
                                    .font(.system(size: 100))
                                Text("iVote")
                                    .font(.custom("Roboto-Bold", size: 30.0))
                                    .foregroundColor(.text)
                                    .fontWeight(.bold)
                                Spacer()
                                    .frame(height: 20)
                                Text("In order to delete your data stored with iVote, you will need to delete your account. Your deletion request will be processed and you will recieve an email confirmation when your data has been deleted from our system. This will not delete your votes from current or previous campaigns.\n")
                                    .foregroundColor(.text)
                                    .font(.custom("Roboto-Regular", size: 16.0))
                                Button {
                                    presentedDeleteData = false
                                } label: {
                                    Text("Request Data Deletion")
                                        .font(.custom("Roboto-Bold", size: 20.0))
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.accent.opacity(0.7))
                                        .foregroundColor(Color.text)
                                        .cornerRadius(10)
                                        .frame(maxWidth: .infinity)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    })
                }.listRowBackground(Color.sec)
            }
            .scrollContentBackground(.hidden)
            .background(Color.background)
            .foregroundColor(Color.text)
        }
        .background(Color.background)
    }
}

struct PrivacyCenterView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 20, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 40, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 30, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 30, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let quint = Canidate(name: "Quint", votes: 10, isSelected: false)
        let emma = Canidate(name: "Emma", votes: 50, isSelected: false)
        let liz = Canidate(name: "Elizabeth", votes: 30, isSelected: false)
        let tori = Canidate(name: "Tori", votes: 30, isSelected: false)
        let cap = Position(positionName: "Captain", canidates: [quint, emma])
        let tres = Position(positionName: "Tresurer", canidates: [liz, tori])
        let campaign2 = Campaign(campaignName: "GT Water Polo", campaignDescription: "Description", positions: [cap, tres], hasVoted: true)
        let viewModel = ViewModel(campaigns: [campaign, campaign2])
        PrivacyCenterView(viewModel: viewModel)
    }
}
