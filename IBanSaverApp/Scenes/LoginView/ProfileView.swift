//
//  ProfileView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 11.01.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text ("KB")
                            .font (.title)
                            .fontWeight (.semibold)
                            .foregroundColor (.white)
                            .frame (width: 72, height: 72) .background (Color (.systemGray3)) .clipShape (Circle ())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font (.subheadline)
                                .fontWeight (.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    SettingsRowView(imageName: "gear",
                                    title: "Version",
                                    tintColor: Color(.systemGray))
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign Out",
                                        tintColor: .red)
                    }
                    
                    Button {
                        print("Delete Account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "Delete Account",
                                        tintColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
