//
//  AddIBanView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import SwiftUI

struct AddIBanView: View {
    // MARK: - Properties
    @EnvironmentObject var flowController: FlowCoordinator
    @State private var ibanNumber: String = ""
    @State private var selectedBank: Bank = .TBCBank
    @Environment(\.dismiss) private var dismiss

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.edgesIgnoringSafeArea(.all)
            contentView
        }
    }
    
    // MARK: - Computed Properties
    private var contentView: some View {
        VStack {
            dismissButton.padding(.top)
            Spacer()
            inputFields
            saveButton.padding()
            Spacer()
        }.padding()
    }
    
    private var dismissButton: some View {
        HStack {
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(.trailing)
            })
        }
    }
    
    private var inputFields: some View {
        VStack(alignment: .leading, spacing: 15) {
            Picker("Select Bank", selection: $selectedBank) {
                ForEach(Bank.allCases, id: \.self) { bank in
                    Text(bank.rawValue).tag(bank)
                }
            }
            
            HStack {
                TextField("IBan Number", text: $ibanNumber, prompt: Text("IBan Number").foregroundColor(.white.opacity(0.5)))
                    .submitLabel(.done)
                    .textFieldStyle(.plain)
                    .frame(height: 16)
                    .padding()
                    .background(Color.midnightGray.cornerRadius(8))
                    .foregroundStyle(.white)
                
                Image(systemName: "camera.viewfinder")
                    .font(.title2)
                    .imageScale(.large)
                    .padding(.trailing)
                    .foregroundStyle(Color(red: 1, green: 96/255, blue: 10/255))
            }
            .padding([.leading, .bottom])
        }
    }
    
    private var saveButton: some View {
        Button(action: {
            // TODO: - func
        }) {
            Text("Save")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 1, green: 96/255, blue: 10/255))
                .cornerRadius(10)
        }
    }
}

#Preview {
    AddIBanView()
}


