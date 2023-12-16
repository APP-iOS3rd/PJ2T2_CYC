//
//  ContentView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var loginModel = LoginModel.shared
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = true
    
    var backButton : some View {
        Button{
            dismiss()
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
                        .font(.pretendardBold_23)
                        .padding(.horizontal, 15)
                        
                    
                    // MARK: - 설정
                    List {
                        Section {
                            ForEach(SettingViewModel().settings, id: \.self) { setting in
                                NavigationLink(destination: setting.destination) {
                                    HStack {
                                        Image("\(setting.imageName)")
                                            .resizable()
                                            .frame(width: 26, height: 26)
                                        Text("\(setting.name)")
                                            .font(.pretendardSemiBold_17)
                                            .padding(.leading, 10)
                                    }
                                }
                            }
                            .listRowBackground(Color.containerColor)
                        }
             
                        
                        // MARK: - 로그아웃

                        Button {
                            loginModel.logout()
                            isloggedInVIew = false
                        } label: {
                            Label("로그아웃", image: "logout")
                                .font(.pretendardSemiBold_17)
                                .foregroundStyle(.logout)
                        }
                        .listRowBackground(Color.containerColor)
                    }
                    .scrollContentBackground(.hidden)
                    
                    // MARK: - Powered by PJ2T2_CYC
                    
                    VStack {
                        Text("2023, Check Your Commit all rights reserved.")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.pretendardLight_11)
                            .offset(y: 10)
                        Text("Powered by PJ2T2_CYC")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.pretendardLight_11)
                            .offset(y: 10)
                    }
                }
                .padding(.top, 5)
            }
        }
        .scrollDisabled(true)
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}


#Preview {
    SettingView()
}
