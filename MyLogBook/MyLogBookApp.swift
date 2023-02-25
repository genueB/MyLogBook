//
//  MyLogBookApp.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

class LogBook: ObservableObject {
    @Published var logs: [LogInfo] = []
    
    // 추가 시 날짜 순으로 입력되어야함
    func addLog(newLog: LogInfo) {
        logs.append(newLog)
    }
    
    func deletce(id: Int) {
        logs.removeAll(where: { $0.id == id })
    }
    
    func getLastLog() -> LogInfo {
        return logs.last ?? LogInfo()
    }
}

@main
struct MyLogBookApp: App {
    var myLogBook: LogBook = LogBook()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(myLogBook)
        }
    }
}
