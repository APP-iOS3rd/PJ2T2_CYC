//
//  GrassView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/12.
//

import SwiftUI
import GrassView

struct CommitView: View {
    @ObservedObject private var loginModel = LoginModel.shared
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(Color.containerColor)
                .frame(width: 350, height: 200)
                .cornerRadius(15.0)
            
            VStack(alignment: .leading) {
                Text("커밋기록")
                    .font(.pretendardBold_17)
                    .padding(.vertical, 7)
                GrassView(loginModel.testCase, row: 4, col: 10, cellColor: .green)
            }
            .padding(40)
        }
        .onAppear() {
            // DispatchQueue 를 넣은 이유
            // 바로 시작되게되면 로그인 부분에서 받아오기 전에 해당 함수가 실행되어 url 부분에서 오류발생
            // 딜레이를 줘서 후에 실행되도록 변경
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                loginModel.getUserEvents()
            }
        }
    }
}

#Preview {
    CommitView()
}
