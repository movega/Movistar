//
//  ChannelListResponse.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation

struct ChannelListResponse: Decodable {
    let channels: [Channel]
    let currentTime: Double
}
