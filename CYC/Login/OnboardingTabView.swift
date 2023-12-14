//
//  OnboardingScroll.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct OnboardingTabView: View {
    
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            VStack {
                Text("커밋 챌린지 목표를 정해보세요")
                    .font(.pretendardBold_20)
                    .padding(.vertical, 15)
                Image("music")
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 177, height: 161)
                    .frame(width: 200, height: 180)
                Image("grass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 90)
            }
            .tag(0)
            
            VStack {
                Text("매일 19시부터 알림 배송")
                    .font(.pretendardBold_20)
                    .padding(.vertical, 15)
                Image("angry")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 180)
                Image("grass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 90)
            }
                .tag(1)
            
            VStack {
                Text("당신의 노력을 잔디로 확인하세요!")
                    .font(.pretendardBold_20)
                    .padding(.vertical, 15)
                Image("surprise")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 180)
                Image("grass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 90)
            }
                .tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    OnboardingTabView()
}
