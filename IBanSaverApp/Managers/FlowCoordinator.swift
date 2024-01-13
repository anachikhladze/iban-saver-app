//
//  FlowCoordinator.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.
//

import SwiftUI
import UIKit

final class FlowCoordinator: ObservableObject {
    private let window: UIWindow
    var viewModel = LoginViewModel()
    var dataFlowViewModel = DataFlowViewModel()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let rootView = LoginRootView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let rootViewHosting = UIHostingController(rootView: rootView)
        window.rootViewController = UINavigationController(rootViewController: rootViewHosting)
    }
    
    func showRegistrationPage() {
        let registrationView = RegistrationView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let hostingView = UIHostingController(rootView: registrationView)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
        }
    }
    
    func showPeopleListPage() {
        let view = PeopleListView()
            .environmentObject(self)
            .environmentObject(dataFlowViewModel)
        let hostingView = UIHostingController(rootView: view)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
        }
    }
    
    func showAddPersonView() {
        let view = AddPersonView()
            .environmentObject(self)
            .environmentObject(dataFlowViewModel)
        let hostingView = UIHostingController(rootView: view)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
        }
    }
    
    func showDetailsView(id: UUID) {
        let view = IBanDetailView(id: id)
            .environmentObject(self)
            .environmentObject(dataFlowViewModel)
        let hostingView = UIHostingController(rootView: view)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
        }
    }
    
    
    func goBack() {
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
}
