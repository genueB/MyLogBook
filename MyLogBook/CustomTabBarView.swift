//
//  CustomTabBarView.swift
//  MyLogBook
//
//  Created by 배진우 on 2022/12/24.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var clickedView: HomeViewType

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                TabBarItem(image: "homekit",
                           text: "홈") {
                    clickedView = .home
                }

                TabBarItem(image: "list.bullet.clipboard",
                           text: "로그") {
                    clickedView = .log
                }

                TabBarItem(image: "plus") {
                    clickedView = .add
                }
                .offset(y: -(geometry.size.height / 2))

                TabBarItem(image: "waveform",
                           text: "커뮤") {
                    clickedView = .map
                }

                TabBarItem(image: "person.crop.circle",
                           text: "설정") {
                    clickedView = .setting
                }
            }
        }
        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
        .onAppear {
        }
    }
}

struct TabBarItem: View {
    let image: String
    var text: String = ""
    var onTap: () -> Void

    var withText: some View {
        VStack(spacing: 5) {
            Image(systemName: image)
//                    .renderingMode(.original)
                .resizable()
                .aspectRatio(1, contentMode: .fit)

            Text(text)
                .foregroundColor(.black)
        }
        .onTapGesture {
            onTap()
        }
    }

    @State private var degree: Double = 0

    var withNoText: some View {
        VStack(spacing: 5) {
            Image(systemName: image)
//                    .renderingMode(.template)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(.white)
                .padding(12)
                .background(
                    Circle()
                        .foregroundColor(.blue)
                )
                .padding(2)
                .rotationEffect(Angle(degrees: degree))
        }
        .background(
            Circle()
                .foregroundColor(.white)
                .shadow(radius: 4)
        )
        .onTapGesture {
            degree = 0
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                for i in 0 ... 180 {
                    degree = Double(i)
                }
            }
            onTap()
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            if text.isEmpty {
                withNoText
            } else {
                withText
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            CustomTabBarView(clickedView: .constant(.home))
                .frame(width: geometry.size.width, height: geometry.size.height / 10)
                .offset(y: geometry.size.height / 2)
        }
    }
}
