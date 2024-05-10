//
//  ChannelListViewModel.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation

class ChannelListViewModel {
    let apiService: ApiService
    
    var channels: [Channel]?
    var currentTime: Double?
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func getChannelList() {
        let channelList = apiService.getChannelList()
        channels = channelList.channels
        currentTime = channelList.currentTime
    }
}
