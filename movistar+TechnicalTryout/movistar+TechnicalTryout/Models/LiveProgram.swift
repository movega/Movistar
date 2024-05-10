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
    let category: String? = nil
    let end_time: String
    let start_time: String
}

extension LiveProgram {
    func isAccessible() -> Bool {
        return AccessibleLiveProgramManager.shared.isChannelAccessible(id)
    }
}
