//
//  ChannelListViewModel.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 9/5/24.
//

import Foundation
import RxSwift
import RxCocoa

class ChannelListViewModel {
    
    private let disposeBag = DisposeBag()
    private let channelsListResponseRelay = BehaviorRelay<ChannelListResponse?>(value: nil)
    
    var channelList: Observable<ChannelListResponse?> {
        return channelsListResponseRelay.asObservable()
    }
    
    func getChannelList() {
        ApiService.shared.getChannelList().map { response in
            let sortedChannels = response.channels.sorted(by: { $0.id < $1.id })
            let filteredChannels = self.getLiveChannels(channels: sortedChannels, currentTime: response.currentTime)
            return ChannelListResponse(channels: filteredChannels, currentTime: response.currentTime)
        }.bind(to: self.channelsListResponseRelay).disposed(by: disposeBag)
    }
    
    func getLiveChannels(channels: [Channel], currentTime: Double) -> [Channel] {
        ChannelManager.shared.isChannelLive(channels: channels, currentTime: currentTime)
    }
}
