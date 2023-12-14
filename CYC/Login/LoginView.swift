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
                    Task{
                            let success = await loginModel.handleCodeFromURL(url)
                            if success{
                                await loginModel.get_access_token()
                                isloggedInVIew = true
                            }
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
