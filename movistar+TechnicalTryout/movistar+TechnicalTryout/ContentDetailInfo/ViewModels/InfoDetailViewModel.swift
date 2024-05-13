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
    private let detailInfoResponse = BehaviorRelay<ContentInfo?>(value: nil)
    private let errorRelay = PublishRelay<Error>()
    
    var channelName: String?
    var channelLogo: String?
    
    var detailInfo: Observable<ContentInfo?> {
        return detailInfoResponse.asObservable()
    }
    
    var errors: Observable<Error> {
        return errorRelay.asObservable()
    }
    
    init(channelName: String?, channelLogo: String?) {
        self.channelName = channelName
        self.channelLogo = channelLogo
    }
    
    func prepare() {
        ApiService.shared.getChannelDetailInfo()
            .subscribe(
                onNext: { [weak self] liveProgram in
                    let channelInfo = ContentInfo(liveProgram: liveProgram, channelName: self?.channelName, channelLogo: self?.channelLogo)
                    self?.detailInfoResponse.accept(channelInfo)
                },
                onError: { [weak self] error in
                    self?.errorRelay.accept(error)
                }
            ).disposed(by: disposeBag)
    }
}
