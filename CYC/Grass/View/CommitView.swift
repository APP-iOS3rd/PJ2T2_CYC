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
    }
}

#Preview {
    CommitView()
}
