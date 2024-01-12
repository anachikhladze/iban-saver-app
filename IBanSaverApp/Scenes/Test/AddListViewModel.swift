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
        func addItem(firstName: String, lastName: String, bank: Bank, ibanNumber: String) {
            let IbanDetail = IBANDetail(bankName: bank, ibanNumber: ibanNumber)
            let newItem = Person(firstName: firstName, lastName: lastName, ibanDetails: [IbanDetail])
            items.append(newItem)
            print(newItem)
        }

    func addPerson(firstName: String, lastName: String) {
            let newItem = Person(firstName: firstName, lastName: lastName, ibanDetails: [])
            items.append(newItem)
            print(newItem)
        }

        func addIbanAndBank(to index: Int, bank: Bank, ibanNumber: String) {
            guard index < items.count else {
                return
            }

            let ibanDetail = IBANDetail(bankName: bank, ibanNumber: ibanNumber)
            items[index].ibanDetails.append(ibanDetail)
        }
    }

