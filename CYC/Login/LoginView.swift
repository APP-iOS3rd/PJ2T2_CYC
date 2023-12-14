//
//  LoginView.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var loginModel = LoginModel.shared
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = false
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                // MARK: - 상단 텍스트 바 텍스트 라인
//                VStack(spacing: 8) {
//                    Text("당신 보고있나?")
//                        .font(.pretendardBold_25)
//                    Text("우리는 당신의 잔디를\n책임진다\n(사실 책임 못진다)")
//                        .font(.pretendardBold_15)
//                }
//                .multilineTextAlignment(.center)
                
                // MARK: - 중간 온보딩 뷰
                VStack {
                    OnboardingTabView()
                }
                
                // MARK: - Github 소셜 로그인 버튼
                Link(destination: loginModel.loginURL ?? URL(string: "")!,
                     label: {
                    Image("githubbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 50)
                })
                .padding()
                .onOpenURL(perform: { url in
                    if loginModel.handleCodeFromURL(url) {
                        loginModel.get_access_token()
                        isloggedInVIew = true
                    }
                })

                Text("2023, Check Your Commit all rights reserved.\nPowered by PJ2T2_CYC")
                    .font(.pretendardLight_11)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    LoginView()
}
