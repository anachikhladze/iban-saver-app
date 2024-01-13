//
//  DataFlowViewModel.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 12.01.24.
//

import Foundation

class DataFlowViewModel: ObservableObject {
    
    @Published var persons: [Person]
    
    init() {
        self.persons = mockupData.mockPersons
    }
    
    func deleteIban(ibanDetail: IBANDetail, from personID: UUID) {
        if let personIndex = persons.firstIndex(where: { $0.id == personID }) {
            if let ibanIndex = persons[personIndex].ibanDetails.firstIndex(where: { $0.id == ibanDetail.id }) {
                persons[personIndex].ibanDetails.remove(at: ibanIndex)
            }
        }
    }
    
    func addIbanForPerson(from person: Person, iban: String, bank: Bank) {
        let newElement = IBANDetail(bankName: bank, ibanNumber: iban)
        if let personIndex = persons.firstIndex(where: { $0.id == person.id }) {
            persons[personIndex].ibanDetails.append(newElement)
        }
    }
}
