//
//  ApiService.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation
import RxSwift
import RxCocoa

class ApiService: BaseApiService {
    
    static let shared = ApiService()
    
    func getChannelList() -> Observable<ChannelListResponse> {
        guard let url = URL(string: Constants.URL.main + Constants.EndPoints.channelList) else {
            return Observable.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: Constants.Errors.wrongUrl.rawValue]))
        }
        return fetch(url: url)
    }
    
    func getChannelDetailInfo() -> Observable<LiveProgram> {
        guard let url = URL(string: Constants.URL.main + Constants.EndPoints.channelDetail) else {
            return Observable.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: Constants.Errors.wrongUrl.rawValue]))
        }
        return fetch(url: url)
    }
}
