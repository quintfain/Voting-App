//
//  FullPolicyView.swift
//  Voting App
//
//  Created by Kearley, Lauren T on 11/25/22.
//

import SwiftUI

struct FullPolicyView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                Section {
                    Image(systemName: "checkmark.shield.fill")
                        .foregroundColor(.text)
                        .font(.system(size: 200))
                    Text("iVote")
                        .font(.custom("Roboto-Bold", size: 40.0))
                        .foregroundColor(.text)
                        .fontWeight(.bold)
                    Text("Privacy Policy")
                        .font(.custom("Roboto-Bold", size: 40.0))
                        .foregroundColor(.text)
                        .frame(maxWidth: .infinity)
                }
                Section {
                    Text("Services We Provide")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("We provide a voting platform upon the purchase of a subscription by a college or university. Any club or organization formally recognized by that college or university can create.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                .foregroundColor(.background)
                Section {
                    Text("Information We Collect")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text ("Personal information that is collected (after obtaining consent from the user) may include:\n - Full name\n - College or university you are attending\n -School email \n - School clubs or organizations you are a part of, including your position within that club or organization\n\nThe following information is collected only if the user does not use a Single Sign-On (SSO) as provided by their college or university to ensure that they are a true student of the school \n - Account username, password, and student school identification number \n\n Campaign data is collected as votes are cast in each particular campaign, it includes the total number of votes cast as well as the number each candidate received.\n\n As a user casts a vote in a particular campaign, their profile is marked as having voted. Their actual vote is not linked to their profile, only the status of having cast a vote or not. This prevents students from voting multiple times and also keeps the voting anonymous." )
                        .fixedSize(horizontal: false, vertical: false)
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("Cookies/ Other Tracking Technology")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("iVote does not use cookies or any other kind of tracking technology.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("External Websites and Third Parties")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("We do not sell personal or campaign data to any third party. Campaign managers are the only ones able to access and export campaign data from iVote.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("How We Use Your Personal Information")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("Personal information is only used to ensure that every vote cast in each campaign was done so by an individual who was eligible to vote in that particular campaign and who has not yet cast a vote in that particular campaign.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("To Whom We Disclose Your Personal Information")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("Personal information can be accessed by the college or university administrator who set up iVote for their campus. No iVote user can access the personal information of another user. ")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("Data Security")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("All personal and campaign data is stored using an industry standard encryption.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("Data Retention and Deletion")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("Campaign data (number of votes per candidate) is retained for 90 days after the voting deadline. The campaign manager has the option to export that data to keep for longer, and iVote has no control over the data once it is exported. After the 90 days however, iVote will delete the campaign data and will no longer have access or be able to export to a campaign manager.\n\n Personal data is also retained for 90 days after the user either deletes their account or stops being a student at the school connected to their account (by graduation, transfer, expulsion, etc.). \n\nIf a subscription purchased by a college or university expires, both personal data and campaign data are “frozen” for 90 days, meaning there can be no changes to or exporting of the data. If the subscription is repurchased, personal and campaign data can be reassessed. If the subscription is canceled (either in this 90 day period after expiration or in the middle of a subscription) then all data will be retained for 30 days before it is deleted from the iVote system.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
                Section {
                    Text("The Choices You Have With Your Information")
                        .multilineTextAlignment(.center)
                        .font(.custom("Roboto-Bold", size: 20.0))
                        .foregroundColor(.text)
                    Text("All information we collect is necessary to use iVote. A user’s name, email address, school attended, and clubs or organizations they are a part of are required to ensure that they could be contacted if the need arose and to make sure that they were seeing the campaigns that were applicable to them. A user’s school id and user/password information is required (if their university does not use a SSO) to ensure that they are actually a student at the school.")
                        .font(.custom("Roboto-Regular", size: 16.0))
                        .foregroundColor(.text)
                }
            }
            .padding(.horizontal)
        }
        .background(Color.background.ignoresSafeArea())
    }
}

struct FullPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        let paul = Canidate(name: "Paul", votes: 0, isSelected: false)
        let riley = Canidate(name: "Riley", votes: 0, isSelected: false)
        let spencer = Canidate(name: "Spencer", votes: 0, isSelected: false)
        let lauren = Canidate(name: "Lauren", votes: 0, isSelected: false)
        let pres = Position(positionName: "Pres", canidates: [paul, riley])
        let vp = Position(positionName: "VP", canidates: [spencer, lauren])
        let campaign = Campaign(campaignName: "Test Campaign", campaignDescription: "Description", positions: [pres, vp], hasVoted: false)
        let viewModel = ViewModel(campaigns: [campaign])
        FullPolicyView(viewModel: viewModel)
    }
}
