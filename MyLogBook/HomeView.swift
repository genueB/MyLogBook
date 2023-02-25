//
//  HomeView.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

enum HomeViewType {
    case home
    case log
    case add
    case map
    case setting
}

class HomeViewModel: ObservableObject {
    @Published var todayDate = Date()
    @Published var recentLog: LogInfo
    @Published var tapView: HomeViewType = .home

    init() {
        recentLog = LogInfo(logNumber: 10,
                            logDate: "2022.12.23",
                            location: "강원도 양양",
                            resortName: "남애다이빙리조트")
    }
}

struct HomeView: View {
    @StateObject var vm = HomeViewModel()

    var body: some View {
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//            VStack {
//                Text("오늘 날짜 : \(vm.todayDate.getYMDDate())")
//                Text("오늘 날씨")
//
//                Text("최근 로그")
//                Text("로그 : \(vm.recentLog.logNumber)")
//                Text("날짜 : \(vm.recentLog.logDate)")
//                Text("위치 : \(vm.recentLog.location)")
//                Text("리조트 : \(vm.recentLog.resortName)")
//            }
        GeometryReader { geometry in
            VStack(spacing: 0) {
                switch vm.tapView {
                case .home:
                    MainView()
                case .log:
                    LogBookView()
                case .add:
                    AddLogView()
                case .map:
                    MapView()
                case .setting:
                    SettingView()
                }
                
                CustomTabBarView(clickedView: $vm.tapView)
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
            }

//                Rectangle()
//                    .frame(height: 0.1)
        }
    }
}
