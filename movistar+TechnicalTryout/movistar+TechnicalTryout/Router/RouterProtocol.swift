//
//  RouterProtocol.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func navigateToView(viewController: UIViewController, from: UIViewController, animated: Bool)
    func showError(message: String, from: UIViewController)
}
