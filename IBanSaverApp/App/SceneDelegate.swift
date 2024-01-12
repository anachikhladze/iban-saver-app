//
//  SceneDelegate.swift
//  IBanSaverApp
//
//  Created by Anna Sumire on 10.01.24.
//

import SwiftUI
import UIKit
//import Firebase

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    
//    override init() {
//        FirebaseApp.configure()
//    }
    
    @ObservedObject var viewModel = LoginViewModel()
    var window: UIWindow?
    private lazy var flowController = FlowCoordinator(window: window!)
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        flowController.showRootView()
        window?.makeKeyAndVisible()
    }
}

