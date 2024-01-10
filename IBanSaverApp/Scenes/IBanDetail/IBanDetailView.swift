//
//  IBanDetailView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 10.01.24.
//

import SwiftUI

struct IBanDetailView: View {
    
    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)

            // Content
            VStack {
                headerView
                ScrollView {
                    VStack(spacing: 20) {
                        IBanNumberView()
                        IBanNumberView()
                        IBanNumberView()
                        IBanNumberView()
                    }
                    .padding()
                }
            }

            addButton
        }
    }
    
    var headerView: some View {
        VStack {
            Text("Your IBAN Numbers")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            Text("Manage all your IBANs in one place")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding([.bottom, .horizontal])
    }

    var addButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // Action to add new IBAN
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 231/255, green: 29/255, blue: 54/255))
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    IBanDetailView()
}


