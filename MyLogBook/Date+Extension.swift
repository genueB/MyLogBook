//
//  Date+Extension.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import Foundation

extension Date {
    ///
    /// YYYY-MM-dd
    func getYMDDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.dd"
        
        return dateFormatter.string(from: self)
    }
}
