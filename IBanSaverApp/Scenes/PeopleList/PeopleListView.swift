//
//  PeopleListView.swift
//  IBanSaverApp
//
//  Created by Nikoloz Gachechiladze on 11.01.24.
//

import SwiftUI

struct PeopleListView: View {
    //MARK: - ViewModel
    @StateObject var peopleListViewModel = PeopleListViewModel()
    @EnvironmentObject var dataFlowViewModel: DataFlowViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    //MARK: - Body
    var body: some View {
        HeaderView()
        sortButton
        scrollView
        button
    }
    
}
//MARK: - Extension
private extension PeopleListView {
    //MARK: - Computed properties
    private var button: some View {
        ActionButton(text: "Add New Contacts") {
            flowCoordinator.showAddPersonView()
        }
        .padding()
    }
    
    private var sortButton: some View {
        HStack {
            Spacer()

            Button(action: {
                peopleListViewModel.sortPeople(&dataFlowViewModel.persons)
            }, label: {
                Label("Sort", systemImage: "arrow.up.arrow.down")
            })
            .padding()
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            VStack (alignment: .center, spacing: 26) {
                ForEach(dataFlowViewModel.persons) { person in
                    PersonView(person: person)
                        .onTapGesture {
                            peopleListViewModel.showDetailsPage(flowCoordinator: flowCoordinator, id: person.id)
                        }
                }
            }
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    PeopleListView()
        .environmentObject(DataFlowViewModel())
}
