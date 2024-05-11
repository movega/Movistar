//
//  Router.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation
import UIKit

class Router: RouterProtocol {

    static let shared = Router()

    private init() { }

    func start(window: UIWindow?) {
            let initialView = ChannelListView()
            let navigationController = UINavigationController(rootViewController: initialView)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    
    func navigateToView(viewController: UIViewController, from: UIViewController, animated: Bool) {
        from.navigationController?.pushViewController(viewController, animated: true)
    }

    func showError(message: String, from: UIViewController) {
        let errorView = ErrorView()
        errorView.messageLabel.text = message
        from.view.addSubview(errorView)

        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView.leadingAnchor.constraint(equalTo: from.view.leadingAnchor, constant: 20),
            errorView.trailingAnchor.constraint(equalTo: from.view.trailingAnchor, constant: -20),
            errorView.topAnchor.constraint(equalTo: from.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            errorView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
