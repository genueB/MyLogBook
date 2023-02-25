//
//  Date+Extension.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/25.
//

import SwiftUI

extension Date {
    // Date -> "20230225" returns
    func formatted(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)!
        
        return formatter.string(from: self)
    }
    
    func getYMDDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        
        return dateFormatter.string(from: self)
    }
}
