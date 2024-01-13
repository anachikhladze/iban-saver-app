//
//  PeopleListViewModel.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 11.01.24.
//

import Foundation

final class PeopleListViewModel: ObservableObject {
    //MARK: - Properties
    @Published var searchText: String = ""
    private var isSorted = false
    
    //MARK: - Methods
    func sortPeople( _ people: inout [Person]) {
        if isSorted {
            people.sort { $0.firstName > $1.firstName }
        } else {
            people.sort { $0.firstName < $1.firstName }
        }
        isSorted.toggle()
    }
    
    func showDetailsPage(flowCoordinator: FlowCoordinator, id: UUID) {
        flowCoordinator.showDetailsView(id: id)
    }
}
