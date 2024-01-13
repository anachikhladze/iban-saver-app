//
//  LoginRootView.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 13.01.24.
//

import SwiftUI

struct LoginRootView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    // MARK: - Body
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                PeopleListView()
                    .environmentObject(flowCoordinator.dataFlowViewModel)
            } else {
                LoginView()
            }
        }
    }
}
