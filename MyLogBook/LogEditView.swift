//
//  LogEditView.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

struct LogEditView: View {
    var logInfo: LogInfo = LogInfo()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("로그 : \(logInfo.logNumber)")
            Text("날짜 : \(logInfo.logDate)")
            Text("지역 : \(logInfo.location)")
            Text("리조트 : \(logInfo.resortName)")
            Text("포인트 : \(logInfo.pointName)")
            Text("날씨 : \(logInfo.weather)")
            Text("버디 : \(logInfo.buddyName)")
            Text("슈트 : \(logInfo.suit)")
            Text("웨이트 : \(logInfo.weight)kg")
        }
    }
}

struct LogEditView_Previews: PreviewProvider {
    static var previews: some View {
        LogEditView()
    }
}
