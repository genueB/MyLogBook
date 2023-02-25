//
//  MainView.swift
//  MyLogBook
//
//  Created by 배진우 on 2023/02/20.
//

import SwiftUI

class MainModel: ObservableObject {
    @Published var todayDateStr: String = Date().getYMDDate()
    @Published var presentTimeStr: String = Date().formatted(format: "HHmm")
    
    @Published var presentTemp: String = ""

    init() {}

    func onAppear() {
        var parameters: [String: Any] = [:]
        parameters["serviceKey"] = "WNpEu2IyYmaVsTCWMykWHH76RQFOeL2slTaUepOjWyaSNmKDvs48B4rHtYQZSgP9SdR1WuEmObMLYbLDxYp4xg=="
        parameters["dataType"] = "JSON"
        parameters["base_date"] = Date().formatted(format: "yyyyMMdd")
        parameters["base_time"] = Date().formatted(format: "HHmm")
        parameters["nx"] = "60"
        parameters["ny"] = "127"

        WeatherClient.getPresentWeather(parameters: parameters,
                                        onComplete: { resultList in
            self.presentTemp = resultList.first(where: { $0.category == "T1H" })?.obsrValue ?? "기온"
        })
    }
}

struct MainView: View {
    @EnvironmentObject var myLogBook: LogBook

    @StateObject var model: MainModel = MainModel()

    var body: some View {
        VStack(spacing: 0) {
            Text("MainView!")
            Text("오늘 날짜 : \(self.model.todayDateStr)")
            Text("현재 날씨")
            Text("현재 기온 : \(self.model.presentTemp)℃")

            Text("최근 로그")
            Text("로그 : \(self.myLogBook.getLastLog().logNumber)")
            Text("날짜 : \(self.myLogBook.getLastLog().logDate)")
            Text("위치 : \(self.myLogBook.getLastLog().location)")
            Text("리조트 : \(self.myLogBook.getLastLog().resortName)")
        }
        .frame(maxHeight: .infinity)
        .onAppear {
            self.model.onAppear()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
