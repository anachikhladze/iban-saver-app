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
    var button: some View {
        Button(action: {
            flowCoordinator.showAddPersonView()
        }) {
            Text("Add New Contacts")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.buttonColor)
                .cornerRadius(25)
        }
        .padding()
    }
    
    var sortButton: some View {
        HStack {
            Spacer()
            Button("Sort") {
                peopleListViewModel.sortPeople(&dataFlowViewModel.persons)
            }
            .padding()
        }
    }
    
    var scrollView: some View {
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
