//
//  ProfileView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    // MARK: - Body
    var body: some View {
        if let _ = viewModel.currentUser {
            List {
                userInfoSection
                generalSection
                accountSection
            }
        }
    }
    
    private var userInfoSection: some View {
        Section {
            HStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 82, height: 82)
                    .background (Color(.systemGray3))
                    .clipShape(Circle ())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.currentUser?.fullname ?? "")
                        .font (.subheadline)
                        .fontWeight (.semibold)
                        .padding(.top, 4)
                    Text(viewModel.currentUser?.email ?? "")
                        .font(.footnote)
                        .accentColor(.gray)
                }
            }
        }
    }
    
    private var generalSection: some View {
        Section("General") {
            SettingsRowView(imageName: "gear",
                            title: "Version",
                            tintColor: Color(.systemGray))
        }
    }
    
    private var accountSection: some View {
        Section("Account") {
            Button {
                flowCoordinator.showPeopleListPage()
            } label : {
                SettingsRowView(imageName: "person.circle.fill",
                                title: "Contacts",
                                tintColor: .button)
            }
         
            Button {
                viewModel.signOut()
            } label: {
                SettingsRowView(imageName: "arrow.left.circle.fill",
                                title: "Sign Out",
                                tintColor: .blue)
            }
            
            Button {
                //TODO: - Under Development
            } label: {
                SettingsRowView(imageName: "xmark.circle.fill",
                                title: "Delete Account",
                                tintColor: .red)
            }
        }
    }
}
