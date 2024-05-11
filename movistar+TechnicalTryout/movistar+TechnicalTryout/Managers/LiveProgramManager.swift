//
//  AccessibleChannelManager.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation

struct LiveProgramManager {
    static let shared = LiveProgramManager()

    private let accessibleIds: [Int] = [24677]

    private init() {}

    func isChannelAccessible(_ id: Int) -> Bool {
        return accessibleIds.contains(id)
    }
}
