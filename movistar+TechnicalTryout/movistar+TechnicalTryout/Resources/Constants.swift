//
//  Endpoints.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation
import UIKit

struct Constants {
    struct URL {
        static let main = "https://api.npoint.io/"
    }
    
    struct EndPoints {
        static let channelList = "f5552c061b8cf68cffa0"
        static let channelDetail = "f3c6446abeb1c5a82079"
    }
    
    enum Errors: String {
        case wrongUrl = "Invalid URL"
        case failedToParseUrl = "Failed to decode the url"
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
