//
//  ProgressTextView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ProgressTextView: View {
    @ObservedObject private var loginModel = LoginModel.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("커밋 챌린지 \(loginModel.commitDay)일째\n")
                .font(.pretendardBold_17)
            
            Text("너 만나러 커밋 하는 중...")
                .font(.pretendardSemiBold_15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
}
