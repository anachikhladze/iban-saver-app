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
        let loginView = LoginView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let hostingView = UIHostingController(rootView: loginView)
        
        let profileView = ProfileView()
            .environmentObject(self)
            .environmentObject(viewModel)
        
        let profileViewHosting = UIHostingController(rootView: profileView)
        
//        if viewModel.userSession != nil {
//            window.rootViewController = UINavigationController(rootViewController: profileViewHosting)
//        } else {
//            window.rootViewController = UINavigationController(rootViewController: hostingView)
//        }
        
        
        let contentView = ContentView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let contentViewHosting = UIHostingController(rootView: contentView)
        window.rootViewController = UINavigationController(rootViewController: contentViewHosting)
    }
    
    func closeDetailView() {
        // Needs to be more sophisticated later when there are more views
        window.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
