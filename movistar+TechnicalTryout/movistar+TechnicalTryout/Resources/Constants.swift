//
//  Endpoints.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation
import UIKit

struct Constants {
    enum Errors: String {
        case unknownError = "Unknown error"
    }
    
    struct Strings {
        struct DetailView {
            static let schedule = "Horario"
            static let description = "Resumen"
        }
        
        struct ChannelList {
            static let title = "TV Guide"
        }
    }
    
    struct Colors {
        static let text: UIColor = .black
        static let background: UIColor = .white
        static let cell: UIColor = .white
    }
}
