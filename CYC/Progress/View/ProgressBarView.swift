//
//  ProgressBarView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ProgressBarView: View {
    @ObservedObject var progressModel = ProgressModel.shared
    @AppStorage("colorkey") var selectedColor: Color = .green
    
    var maxProgressWidth: Double {
            let containerWidth = UIScreen.main.bounds.width - 95
            let progressWidth = CGFloat(Double(progressModel.progress) / Double(progressModel.goal)) * containerWidth
            return min(progressWidth, containerWidth)
        }
    
    var body: some View {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.bgColor)
                
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color.white)
                    .frame(height: 4)
                    .offset(x: 2, y: 0)
                
                // 색깔 그래프, 공룡 이미지 부분
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(selectedColor)
                    .frame(height: 4)
                    //progress bar 움직이는 이미지
                    .overlay(
                        Image(.kissGreen)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(x: 20, y: 0)
                        ,alignment: .trailing
                    )
                    // min 값을 줘야 0 ~ commitday까지 그래프 애니메이션 표시 가능
                    .frame(width: maxProgressWidth)
                    .fixedSize()
            }
        .offset(x: 20, y: 6)
        .padding(.trailing, 10)
    }
}

