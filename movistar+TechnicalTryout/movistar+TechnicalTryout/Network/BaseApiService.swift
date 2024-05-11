//
//  BaseApiService.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 10/5/24.
//

import Foundation
import RxSwift
import RxCocoa

class BaseApiService {
    
    func fetch<T: Decodable>(url: URL) -> Observable<T> {
        return URLSession.shared.rx.response(request: URLRequest(url: url))
            .map { (response, data) -> T in
                if response.statusCode == 200 {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
                }
            }
            .observe(on: MainScheduler.instance)
    }
}
