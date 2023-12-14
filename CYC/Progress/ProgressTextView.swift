//
//  ProgressTextView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ProgressTextView: View {
    @Binding var step: Int
    @State private var days: Int = 0
    @ObservedObject private var loginModel = LoginModel.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            let _ = days
            Text("커밋 챌린지 \(days)일째\n")
                .font(.pretendardBold_17)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        days = loginModel.findConsecutiveDates(withData: loginModel.testCase)
                    }
                }
            
            Text("너 만나러 커밋 하는 중...")
                .font(.pretendardBold_12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
}
