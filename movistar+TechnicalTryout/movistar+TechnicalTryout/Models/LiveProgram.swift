//
//  LiveProgram.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation

struct LiveProgram: Decodable {
    let id: Int
    let title: String
    var cover: String? = nil
    var description: String? = nil
    var category: String? = nil
    let endTime: String
    let startTime: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case cover
        case description
        case category
        case endTime = "end_time"
        case startTime = "start_time"
    }
}

extension LiveProgram {
    func isAccessible() -> Bool {
        return AccessibleLiveProgramManager.shared.isChannelAccessible(id)
    }
}
