//
//  ContentView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                VStack(alignment: .leading, spacing: -2) {
                    Text("설정")
                        .font(.pretendardBold_25)
                        .padding(.horizontal, 25)
                    List {
                        Section {
                            NavigationLink(destination: NotificationView()) {
                                Label("알림설정", image: "worker")
                                    .font(.pretendardSemiBold_17)
                            }
                            Label("CYC에 대해서", image: "idea")
                                .font(.pretendardSemiBold_17)
                            Label("라이센스", image: "idea")
                                .font(.pretendardSemiBold_17)
                        }
                        .listRowBackground(Color.containerColor)
                        Label("로그아웃", image: "logout")
                            .font(.pretendardSemiBold_17)
                            .foregroundColor(Color.logoutColor)
                            .listRowBackground(Color.containerColor)
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.bgColor)
                    
                }
                .padding(.top, 20)
            }
            
        }
    }
}


#Preview {
    SettingView().preferredColorScheme(.dark)
}
