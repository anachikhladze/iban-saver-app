//
//  IBanDetailView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 10.01.24.
//

import SwiftUI

struct IBanDetailView: View {
    // MARK: - Properties
    @EnvironmentObject var flowController: FlowCoordinator
    @State var showAddIbanView: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            contentView
        }
        .sheet(isPresented: $showAddIbanView, content: {
            AddIBanView()
                .presentationDetents([.fraction(0.4)])
        })
    }
    
    // MARK: - Computed Properties
    private var contentView: some View {
        VStack {
            headerView
            iBanList
            addIBanButton.padding()
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 16) {
            Text("Your IBan Numbers")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 5)
            
            Image(.safeLock)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
        }
        .padding()
    }
    
    private var addIBanButton: some View {
        Button(action: {
            showAddIbanView = true
        }) {
            Label("Add New IBan", systemImage: "plus")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 1, green: 96/255, blue: 10/255))
                .cornerRadius(10)
        }
    }
    
    private var iBanList: some View {
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
}

#Preview {
    IBanDetailView()
        .environmentObject(FlowCoordinator(window: UIWindow()))
}


