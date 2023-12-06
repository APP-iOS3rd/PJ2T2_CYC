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
                    
                    // MARK: - 헤더
                    Text("설정")
                        .font(.pretendardBold_25)
                        .padding(.horizontal, 25)
                    
                    // MARK: - 설정
                    List {
                        Section {
                            ForEach(SettingViewModel().settings, id: \.self) { setting in
                                
                                NavigationLink(destination: setting.destination) {
                                    Label(setting.name, image: setting.imageName)
                                        .font(.system(size: 17, weight: .semibold))
                                }
                            }
                            .listRowBackground(Color.containerColor)
                        }
                        
                        // MARK: - 로그아웃
                        Label("로그아웃", image: "logout")
                            .font(.pretendardSemiBold_17)
                            .foregroundColor(Color.logoutColor)
                            .listRowBackground(Color.containerColor)
                    }
                    .scrollContentBackground(.hidden)

                }
                .padding(.top, 20)
                
            }
            
        }
        
    }
}


#Preview {
    SettingView().preferredColorScheme(.dark)
}
