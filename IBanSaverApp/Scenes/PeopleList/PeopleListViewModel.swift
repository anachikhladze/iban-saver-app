//
//  PeopleListViewModel.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 11.01.24.
//

import Foundation

class PeopleListViewModel: ObservableObject {
    //MARK: - Properties
    @Published var people: [Person] = [
        Person(firstName: "John", lastName: "Danashvili", ibanDetails: []),
        Person(firstName: "Nickolas", lastName: "Banashvili", ibanDetails: []),
        Person(firstName: "Person", lastName: "Kanashvili", ibanDetails: []),
        Person(firstName: "Last", lastName: "Manashvili", ibanDetails: []),
        Person(firstName: "Jane", lastName: "Anashvili", ibanDetails: [])
    ]
    @Published var searchText: String = ""
    private var isSorted = false
    
    //MARK: - Methods
    func sortPeople() {
        if isSorted {
            people.sort { $0.lastName > $1.lastName }
        } else {
            people.sort { $0.lastName < $1.lastName }
        }
        isSorted.toggle()
    }
    
}
