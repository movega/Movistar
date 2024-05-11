//
//  File.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation

struct Channel: Decodable {
    let id: Int
    let logo: String
    let name: String
    let liveProgram: LiveProgram
    
    enum CodingKeys: String, CodingKey {
        case id
        case logo
        case name
        case liveProgram = "live_program"
    }
}
