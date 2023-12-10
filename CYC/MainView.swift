//
//  MainView.swift
//  CYC
//
//  Created by 강치우 on 12/7/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                ScrollView {
                    VStack {
                        // MARK: - 네비게이션 타이틀
                        HStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                            
                            Spacer()
                            
                            
                            NavigationLink(destination: SettingView()) {
                                // MARK: 모드에 따라서 이미지 색상 변경
                                Image(colorScheme == .dark ? "gear" : "gearblack")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                            }
                        }
                        .padding()
                        
                        // MARK: - 상단 텍스트
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi, Ciu")
                            
                            Text("오늘 커밋 잡쉈어?")
                        }
                        .font(.pretendardBold_25)
                        .hSpacing(.leading)
                        .padding(.leading, 20)
                    }
                    
                    // MARK: - 하단 뷰 연결
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
