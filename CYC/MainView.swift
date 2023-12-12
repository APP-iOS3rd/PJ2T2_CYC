//
//  MainView.swift
//  CYC
//
//  Created by 강치우 on 12/7/23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = false
    @ObservedObject private var loginModel = LoginModel.shared
    @Query private var todoModel: [TodoModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                VStack {
                    // MARK: - 네비게이션 타이틀
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                        
                        Spacer()
                        
                        NavigationLink(destination: SettingView()) {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundStyle(.base)
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        // MARK: - 상단 텍스트
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi, \(loginModel.userLogin ?? "CYC")")
                            
                            Text("오늘 커밋 잡쉈어?")
                        }
                        .font(.pretendardBold_25)
                        .hSpacing(.leading)
                        .padding(.leading, 20)
                        
                        // MARK: - 하단 뷰 연결
                        ProgressView()   
                        // MARK: - 알림장 미리보기
                        TodoPreView()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
