//
//  InfoHelper.swift
//  movistar+TechnicalTryout
//
//  Created by Optiva Media on 11/5/24.
//

import Foundation

class InfoHelper {
    static let shared = InfoHelper()

    private init() {}
    
    func setUpTimeLabel(startTime: Double, endTime: Double) -> String {
        let startDate = Date(timeIntervalSince1970: startTime / 1000)
        let endDate = Date(timeIntervalSince1970: endTime / 1000)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        
        let startString = formatter.string(from: startDate)
        let endString = formatter.string(from: endDate)
        
        let timeString = "\(startString) - \(endString)"
        
        return timeString
    }
}
