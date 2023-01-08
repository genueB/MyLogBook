//
//  MainView.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

enum MainViewType {
    case home
    case log
    case add
    case map
    case setting
}

class MainViewModel: ObservableObject {
    @Published var todayDate =  Date()
    @Published var recentLog: LogInfo
    @Published var tapView: MainViewType = .home {
        didSet {
            switch tapView {
            case .home:
                color = .red
            case .log:
                color = .green
            case .add:
                color = .systemPink
            case .map:
                color = .brown
            case .setting:
                color = .cyan
            }
        }
    }
    @Published var color: UIColor = .red
    
    init() {
        recentLog = LogInfo(logNumber: 10,
                            logDate: "2022.12.23",
                            location: "강원도 양양",
                            resortName: "남애다이빙리조트")
    }
}

struct MainView: View {
    @StateObject var vm = MainViewModel()
    
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
                Color(vm.color)
                
                CustomTabBarView(clickedView: $vm.tapView)
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                
//                Rectangle()
//                    .frame(height: 0.1)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
