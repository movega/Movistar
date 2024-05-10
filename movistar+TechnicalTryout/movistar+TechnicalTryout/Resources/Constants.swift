//
//  Endpoints.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation

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
    }
}
