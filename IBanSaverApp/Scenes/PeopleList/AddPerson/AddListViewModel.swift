//
//  ListViewModel.swift
//  IBanSaverApp
//
//  Created by salome on 12.01.24.
//


import Foundation

class AddListViewModel: ObservableObject  {
    @Published var items: [Person] = []
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(firstName: String, lastName: String, ibanDetails: [IBANDetail] , persons: inout [Person], flowCoordinator: FlowCoordinator) {
        let newItem = Person(firstName: firstName, lastName: lastName, ibanDetails: ibanDetails)
        persons.append(newItem)
        print(newItem)
        flowCoordinator.goBack()
    }
    
    func addIbanAndBank(to index: Int, bank: Bank, ibanNumber: String) {
        guard index < items.count else {
            return
        }
        
        let ibanDetail = IBANDetail(bankName: bank, ibanNumber: ibanNumber)
        items[index].ibanDetails.append(ibanDetail)
    }
}

