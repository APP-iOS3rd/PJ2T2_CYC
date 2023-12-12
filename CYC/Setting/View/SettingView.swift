//
//  ContentView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.base)
                    .bold()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: -15) {
                    
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
//                        NavigationLink(destination: loginView()) {
                            Label("로그아웃", image: "logout")
                                .font(.pretendardSemiBold_17)
                                .foregroundColor(Color.logoutColor)
                                .listRowBackground(Color.containerColor)
//                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    Text("2023, Check Your Commit all rights reserved.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.pretendardLight_11)
                        .offset(y: 10)
                    Text("Powered by PJ2T2_CYC")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.pretendardLight_11)
                        .offset(y: 10)
                }
                .padding(.top, 15)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}


#Preview {
    SettingView()
}
