//
//  ProgressTextView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ProgressTextView: View {
    @Binding var step: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("커밋 챌린지 \(step)일째\n")
                .font(.pretendardBold_17)
            Text("너 만나러 커밋 하는 중...")
                .font(.pretendardBold_12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
}
