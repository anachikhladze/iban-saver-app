//
//  IBanNumberViewModel.swift
//  IBanSaverApp
//
//  Created by Saba Gogrichiani on 11.01.24.
//

import Foundation

class IBanNumberViewModel: ObservableObject {
    
    var bankName = "TBC Bank"
    
    func copyIban() {
        // Copy IBan action
        print("Copy IBan")
    }

    func shareIban() {
        // Share IBan action
        print("Share IBan")
    }

    func deleteIban() {
        // Delete IBan action
        print("Delete IBan")
    }
}


