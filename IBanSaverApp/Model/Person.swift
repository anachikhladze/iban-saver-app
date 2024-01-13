//
//  Person.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var ibanDetails: [IBANDetail]
}

struct IBANDetail: Hashable, Identifiable {
    let id = UUID()
    var bankName: Bank
    var ibanNumber: String
}

enum Bank: String, CaseIterable {
    case TBCBank = "TBC Bank"
    case BOG = "Bank Of Georgia"
    case Liberty = "Liberty Bank"
    case nationalBank = "National Bank Of Georgia"
}

final class mockupData {
    static var mockPersons = [
        Person(firstName: "Bob", lastName: "Smith", ibanDetails: [
            IBANDetail(bankName: .Liberty, ibanNumber: "GE00LB1234567890123"),
            IBANDetail(bankName: .nationalBank, ibanNumber: "GE00NB1234567890123")
        ]),
        Person(firstName: "Alice", lastName: "Johnson", ibanDetails: [
            IBANDetail(bankName: .TBCBank, ibanNumber: "GE00TB1234567890123"),
            IBANDetail(bankName: .BOG, ibanNumber: "GE00BG1234567890123")
        ]),
        Person(firstName: "Carol", lastName: "Williams", ibanDetails: [
            IBANDetail(bankName: .TBCBank, ibanNumber: "GE00TB2234567890123")
        ]),
        Person(firstName: "David", lastName: "Brown", ibanDetails: [
            IBANDetail(bankName: .BOG, ibanNumber: "GE00BG2234567890123"),
            IBANDetail(bankName: .Liberty, ibanNumber: "GE00LB2234567890123")
        ]),
        Person(firstName: "Eve", lastName: "Davis", ibanDetails: [
            IBANDetail(bankName: .nationalBank, ibanNumber: "GE00NB2234567890123")
        ])
    ]
}

