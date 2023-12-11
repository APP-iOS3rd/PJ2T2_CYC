//
//  LoginView.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var loginModel = LoginModel.shared
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 100)
                
                // MARK: - 상단 텍스트 바 텍스트 라인
                VStack(spacing: 8) {
                    Text("머징 보고있나?")
                        .font(.pretendardBold_25)
                    Text("우리는 머징을 따라간다\n 참고했다 정도?\n(사실 거의 다 따라했다)")
                        .font(.pretendardBold_15)
                }
                .multilineTextAlignment(.center)
                
                // MARK: - 중간 온보딩 뷰
                VStack {
                    OnboardingTabView()
                }
                
                // MARK: - Github 소셜 로그인 버튼
//                Link("Github Login", destination: loginModel.loginURL ?? URL(string: "")!)
//                    .onOpenURL(perform: { url in
//                        loginModel.handleCodeFromURL(url)
//                    })
                
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
                        LoginModel.shared.get_access_token()
                    }
                })
                Text(loginModel.userLogin ?? "111")
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
