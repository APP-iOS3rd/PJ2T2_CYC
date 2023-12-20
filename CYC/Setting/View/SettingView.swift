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
    
    @State private var showingAlert = false
    
    var backButton : some View {
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.gray)
                    .bold()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        // MARK: - 헤더
                        Text("설정")
                            .font(.pretendardBold_23)
                            .padding(.horizontal, 15)
                        
                        // MARK: - 설정
                        VStack(alignment: .leading) {
                            ForEach(SettingViewModel().settings, id: \.self) { setting in
                                NavigationLink(destination: setting.destination) {
                                    HStack {
                                        Image("\(setting.imageName)")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        Text("\(setting.name)")
                                            .font(.pretendardMedium_17)
                                            .padding(.leading, 10)
                                        
                                    }
                                    .foregroundStyle(.base)
                                    .padding(.vertical, 8)
                                }
                                
                            }
                            
                            // MARK: - 로그아웃
                            Button {
                                showingAlert.toggle()
                            } label: {
                                HStack(spacing: 18) {
                                    Image("trash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                    
                                    Text("로그아웃")
                                }
                                .font(.pretendardMedium_17)
                                .foregroundStyle(.logout)
                                .padding(.top, 8)
                            }
                            .alert("정말 로그아웃 하시겠어요?", isPresented: $showingAlert) {
                                Button("로그아웃", role: .destructive) {
                                    loginModel.logout()
                                    isloggedInVIew = false
                                }
                                
                                Button("닫기", role: .cancel) {
                                    showingAlert = false
                                }
                            }
                        }
                        .padding(.leading, 15)
                    }
                    .hSpacing(.leading)
                }
                .padding(.top, 5)
                // MARK: - Powered by PJ2T2_CYC
                VStack(spacing: 8) {
                    Text("2023, Check Your Commit all rights reserved.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.pretendardLight_11)
                    Text("Powered by PJ2T2_CYC")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.pretendardLight_11)
                }
                .vSpacing(.bottom)
            }
            
        }
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}


#Preview {
    SettingView()
}
