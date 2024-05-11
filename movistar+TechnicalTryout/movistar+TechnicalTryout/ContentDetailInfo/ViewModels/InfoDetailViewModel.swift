//
//  DetailInfoViewmodel.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation
import RxSwift
import RxCocoa

class InfoDetailViewModel {
    
    private let disposeBag = DisposeBag()
    private let detailInfoResponse = BehaviorRelay<LiveProgram?>(value: nil)
    
    var detailInfo: Observable<LiveProgram?> {
        return detailInfoResponse.asObservable()
    }
    
    var channelName: String?
    var channelLogo: String?
    
    init(channelName: String?, channelLogo: String?) {
        self.channelName = channelName
        self.channelLogo = channelLogo
        ApiService.shared.getChannelDetailInfo().bind(to: self.detailInfoResponse).disposed(by: disposeBag)
    }
}
