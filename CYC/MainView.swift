//
//  MainView.swift
//  CYC
//
//  Created by 강치우 on 12/7/23.
//

import SwiftUI

struct MainView: View {
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
                                    Image("gear")
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
