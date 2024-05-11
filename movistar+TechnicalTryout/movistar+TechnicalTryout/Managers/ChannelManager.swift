//
//  ChannelManager.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation

struct ChannelManager {
    static let shared = ChannelManager()

    private init() {}

    func isChannelLive(channels: [Channel], currentTime: Double) -> [Channel] {
        return channels.filter { Double($0.liveProgram.startTime) ?? 0 <= currentTime && currentTime <= Double($0.liveProgram.endTime) ?? 0 }
    }
}
