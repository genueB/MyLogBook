//
//  LogBookView.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/20.
//

import SwiftUI

struct LogBookView: View {
    @EnvironmentObject var myLogBook: LogBook
    
    var dummyLogs = [LogInfo(id: 0, logNumber: 0, logDate: "2222-11-20"),
                     LogInfo(id: 1, logNumber: 1, logDate: "2222-11-21"),
                     LogInfo(id: 2, logNumber: 2, logDate: "2222-11-22"),
                     LogInfo(id: 3, logNumber: 3, logDate: "2222-11-23"),
                     LogInfo(id: 4, logNumber: 4, logDate: "2222-11-24"),
                     LogInfo(id: 5, logNumber: 5, logDate: "2222-11-25"),
                     LogInfo(id: 6, logNumber: 6, logDate: "2222-11-26"),
                     LogInfo(id: 7, logNumber: 7, logDate: "2222-11-27"),
                     LogInfo(id: 8, logNumber: 8, logDate: "2222-11-28"),
                     LogInfo(id: 9, logNumber: 9, logDate: "2222-11-29")]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 2) {
                    ForEach(dummyLogs) { log in
                        LogCell(log: log)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
        .onAppear {
            for log in dummyLogs {
                myLogBook.logs.append(log)
            }
        }
    }
}

struct LogCell: View {
    var id: Int = 0
    var logNumber: Int = 1
    var date: String = "2022년 1월 2일"
    
    init(log: LogInfo) {
        id = log.id
        logNumber = log.logNumber
        date = log.logDate
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(logNumber)로그")
            Text("\(date)")
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.gray)
    }
}

struct LogBookView_Previews: PreviewProvider {
    static var previews: some View {
        LogBookView()
    }
}
