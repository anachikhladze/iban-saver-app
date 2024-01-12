//
//  ListViewModel.swift
//  IBanSaverApp
//
//  Created by salome on 12.01.24.
//

import Foundation

class AddListViewModel: ObservableObject {
    @Published var items: [Person] = [] //{
//        didSet {
//            saveItems()
//        }
   // }

    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey)
//            let savedItems = try? JSONDecoder().decode([Person].self, from: data)
        else {
            return
        }

        //items = savedItems
    }

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

//    func saveItems() {
//        if let encodeData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodeData, forKey: itemsKey)
//
//        }
//    }
}

