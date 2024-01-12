//
//  IBanDetailView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 10.01.24.
//

import SwiftUI

struct IBanDetailView: View {
    // MARK: - Properties
    @State var showAddIbanView: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            contentView
        }
        .sheet(isPresented: $showAddIbanView, content: {
            AddIBanView().presentationDetents([.fraction(0.4)])
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
        ActionButton(action: {
            showAddIbanView = true
        }, label: "Add New IBan", systemImage: "plus")
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


