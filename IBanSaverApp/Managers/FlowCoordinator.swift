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
            hostingView.navigationItem.hidesBackButton = true
        }
    }
    
    func closeDetailView() {
        // Needs to be more sophisticated later when there are more views
        window.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
