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
    @ObservedObject private var progressModel = ProgressModel.shared
    @Query private var todoModel: [TodoModel]
    
    @State private var appearanceMode: AppearanceMode = .System
    @State private var colorScheme: ColorScheme? = nil
    @State var show = true
    
    // MARK: 커밋 변수
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                VStack {
                    // MARK: - 네비게이션 타이틀
                    HStack {
                        Image("logo1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                        
                        Spacer()
                        
                        // DL Mode
                        Button {
                            withAnimation {
                                show.toggle()
                            }
                        } label: {
                            Image(systemName: "lamp.table.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.base)
                                .padding(.horizontal, 5)
                        }
                        
                        NavigationLink(destination: SettingView()) {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundStyle(.base)
                        }
                    }
                    .padding(.horizontal, 22)
                    .padding(.vertical)
                    
                    ScrollView {
                        // MARK: - 상단 텍스트
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi, \(loginModel.userName ?? "CYC")")
                            
                            Text("오늘 커밋 잡쉈어?")
                        }
                        .font(.pretendardBold_25)
                        .hSpacing(.leading)
                        .padding(.leading, 25)
                        
                        // MARK: - 하단 뷰 연결
                        ProgressView()
                            .padding(.horizontal, 5)
                        
                        
                        // MARK: - 잔디 뷰 연결
                        CommitView()
                            .padding(.top, -15)
                        
                        // MARK: - 알림장 미리보기
                        TodoPreView()
                        
                    }
                    .scrollIndicators(.hidden)
                }
                DLMode(appearanceMode: $appearanceMode, colorScheme: $colorScheme, show: $show)
                    .ignoresSafeArea()
            }
        }
        .onAppear() {
            loginModel.getCommitData()
        }
    }
}

#Preview {
    MainView()
}
