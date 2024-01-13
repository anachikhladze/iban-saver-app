//
//  AddListView.swift
//  IBanSaverApp
//
//  Created by salome on 12.01.24.
//

import SwiftUI

struct AddPersonView: View {
    
    // MARK: - Properties
    @StateObject var addPersonViewModel = AddListViewModel()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var selectedBank: Bank = .TBCBank
    @State private var iban: String = ""
    @State private var showErrorAlert = false
    @State var showLiveScanAlert = false
    @State private var ibanDetails: [IBANDetail] = []
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    // MARK: - Body
    var body: some View {
        Form {
            nameDetailFields
            if ibanDetails.isEmpty {
                EmptyView()
            } else {
                ibanList
            }
            addNewIban
            ibanDetailFields
        }
    }
    
    // MARK: - Computed Properties
    private var nameDetailFields: some View {
        Section("person") {
            TextField("First Name", text: $firstName)
            
            TextField("Last Name", text: $lastName)
        }
    }
    
    private var ibanList: some View {
        Section("IBAN") {
            ForEach(ibanDetails) { ibanDetail in
                Text("\(ibanDetail.bankName.rawValue): \(ibanDetail.ibanNumber)")
            }
            .onDelete(perform: addPersonViewModel.deleteItem)
        }
    }
    
    private var addNewIban: some View {
        Section {
            HStack {
                Text("Add New IBAN")
                Spacer()
                Button(action: addPlusButtonPressed) {
                    Image(systemName:"plus.circle")
                        .font(.title3)
                        .imageScale(.large)
                }
            }
        }
    }
    
    private var ibanDetailFields: some View {
        Section("IBAN DETAIL") {
            bankPicker
            ibanInput
            ActionButton(text: "Add Person and IBAN") {
                saveButtonPressed()
            }
        }
        .padding(10)
        .cornerRadius(5)
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Please fill all information"),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    private var bankPicker: some View {
        Picker("Select Bank", selection: $selectedBank) {
            ForEach(Bank.allCases, id: \.self) { bank in
                Text(bank.rawValue).tag(bank)
            }
        }
    }
    
    private var ibanInput: some View {
        HStack {
            RoundedInputView(text: $iban)
            Spacer()
            ScanIconView {
                showLiveScanAlert.toggle()
            }
        }
        .sheet(isPresented: $showLiveScanAlert) {
            LiveTextFromCameraScan(liveScan: $showLiveScanAlert, scannedText: $iban)
        }
    }
}

// MARK: - Extensions
extension AddPersonView {
    private func saveButtonPressed() {
        if !ibanDetails.isEmpty || !iban.isEmpty,
           !firstName.isEmpty, !lastName.isEmpty {
            ibanDetails.append(IBANDetail(bankName: selectedBank, ibanNumber: iban))
        } else {
            showErrorAlert = true
            return
        }
        
        addPersonViewModel.addItem(firstName: firstName, lastName: lastName, ibanDetails: ibanDetails, persons: &dataFlowViewModel.persons, flowCoordinator: flowCoordinator)
    }
    
    private func addPlusButtonPressed() {
        guard !iban.isEmpty else { return showErrorAlert = true }
        let newIbanDetail = IBANDetail(bankName: selectedBank, ibanNumber: iban)
        ibanDetails.append(newIbanDetail)
        selectedBank = .TBCBank
        iban = ""
    }
}

#Preview {
    AddPersonView(addPersonViewModel: AddListViewModel())
        .environmentObject(AddListViewModel())
}

