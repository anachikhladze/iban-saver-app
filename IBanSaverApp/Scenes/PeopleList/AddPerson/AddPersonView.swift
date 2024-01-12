//
//  AddListView.swift
//  IBanSaverApp
//
//  Created by salome on 12.01.24.
//

import SwiftUI

struct AddPersonView: View {
    @StateObject var listViewModel = AddListViewModel()
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var selectedBankIndex: Int = 0
    @State private var iban: String = ""
    @State private var showAlert = false
    @State private var ibanDetails: [IBANDetail] = []
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    var body: some View {
        
        Form {
            Section {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                List {
                    ForEach(ibanDetails, id: \.self)
                    {ibanDetail in
                        HStack
                        {
                            Text("Bank: \(ibanDetail.bankName.rawValue)")
                            Text("IBAN: \(ibanDetail.ibanNumber)")
                        }
                    } .onDelete(perform: listViewModel.deleteItem)
                }
                
                Button(action: addPlusButtonPressed) {
                    
                    Image(systemName:"plus.circle")
                        .resizable()
                        .frame(width:20, height: 20)
                    
                }
                
            }
            Section{
                Picker("Select Bank", selection: $selectedBankIndex) {
                    ForEach(0..<Bank.allCases.count, id: \.self) {
                        Text(Bank.allCases[$0].rawValue)
                    }
                }
                
                Text("Enter IBAN")
                TextField("IBAN", text: $iban)
                Button(action: saveButtonPressed) {
                    HStack{
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scan IBAN")
                    }
                    
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    Spacer()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: saveButtonPressed) {
                    Text("Add Person and IBAN")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(20)
                    Spacer()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            .disableAutocorrection(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Please fill all information"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    func addPlusButtonPressed() {
        guard selectedBankIndex < Bank.allCases.count,
              !iban.isEmpty
        else {
            showAlert = true
            return
        }
        
        let selectedBank = Bank.allCases[selectedBankIndex]
        let newIbanDetail = IBANDetail(bankName: selectedBank, ibanNumber: iban)
        ibanDetails.append(newIbanDetail)
        
        // Clear the form fields
        selectedBankIndex = 0
        iban = ""
    }
    
    func saveButtonPressed() {
        guard !ibanDetails.isEmpty || !iban.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty
              
        else {
            showAlert = true
            return
        }
        
        listViewModel.addItem(firstName: firstName, lastName: lastName, ibanDetails: ibanDetails, persons: &dataFlowViewModel.persons, flowCoordinator: flowCoordinator)
    }
}

#Preview {
    NavigationView {
        AddPersonView(listViewModel: AddListViewModel())
            .environmentObject(AddListViewModel())
    }
}

