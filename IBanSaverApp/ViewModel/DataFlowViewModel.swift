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
}
