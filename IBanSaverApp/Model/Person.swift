//
//  Person.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.
//

import Foundation

struct Person {
    var firstName: String
    var lastName: String
    var ibanDetails: [IBANDetail]
}

struct IBANDetail {
    var bankName: Bank
    var ibanNumber: String
}

enum Bank: String {
    case TBCBank = "TBC Bank"
    case BOG = "Bank Of Georgia"
    case Liberty = "Liberty Bank"
    case nationalBank = "National Bank Of Georgia"
}
