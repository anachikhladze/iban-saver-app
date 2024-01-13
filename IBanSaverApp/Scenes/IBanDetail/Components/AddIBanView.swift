//
//  AddIBanView.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import SwiftUI
import VisionKit

struct AddIBanView: View {
    // MARK: - Properties
    @State private var ibanNumber: String = ""
    @State private var selectedBank: Bank = .TBCBank
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    @State var liveScan = false
    var person: Person
    
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
            picker
            ibanInput
        }
    }
    
    private var picker: some View {
        Picker("Select Bank", selection: $selectedBank) {
            ForEach(Bank.allCases, id: \.self) { bank in
                Text(bank.rawValue).tag(bank)
            }
        }
    }
    
    private var ibanInput: some View {
        HStack {
            TextField("", text: $ibanNumber, prompt: Text("IBan Number").foregroundColor(.white.opacity(0.5)))
                .submitLabel(.done)
                .textFieldStyle(.plain)
                .frame(height: 16)
                .padding()
                .background(Color.midnightGray.cornerRadius(8))
                .foregroundStyle(.white)
            
            ScanIconView {
              liveScan.toggle()
            }
            .padding(.trailing)
        }
        .padding([.leading, .bottom])
        .sheet(isPresented: $liveScan) {
            LiveTextFromCameraScan(liveScan: $liveScan, scannedText: $ibanNumber)
        }
    }
    
    private var saveButton: some View {
        ActionButton(text: "Save") {
            dataFlowViewModel.addIbanForPerson(from: person, iban: ibanNumber, bank: selectedBank)
            dismiss()
        }
    }
}

#Preview {
    AddIBanView(person: mockupData.mockPersons[0])
}


