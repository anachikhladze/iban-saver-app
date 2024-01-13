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
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    var id: UUID
    var person: Person? {
        if let person = dataFlowViewModel.persons.first(where: { $0.id == id }) {
            return person
        } else {
            return nil
        }
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            contentView
        }
        .sheet(isPresented: $showAddIbanView, content: {
            AddIBanView(person: person!).presentationDetents([.fraction(0.4)])
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
            Text("\(person?.firstName ?? "No") \(person?.lastName ?? "Name")")
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
        ActionButton(label: "Add New Iban", systemImage: "plus") {
            showAddIbanView = true
        }
    }
    
    private var iBanList: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let person = person {
                    ForEach(person.ibanDetails) { iban in
                        IBanNumberView(iban: iban, person: person)
                    }
                } else {
                    Text("No IBAN details found for this ID.")
                }
            }
            .padding()
        }
    }
}

#Preview {
    IBanDetailView(id: mockupData.mockPersons[0].id)
        .environmentObject(DataFlowViewModel())
}


