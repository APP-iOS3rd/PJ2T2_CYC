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
            //progress bar 전체 범위 뷰
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.bgColor)
            }
            RoundedRectangle(cornerRadius: 60)
                .fill(Color.white)
                .frame(height: 4)
                .offset(x: 2, y: 0)
            
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(selectedColor)
                    .frame(height: 4)
            }
            //progress bar 움직이는 이미지
            .overlay(
                    Image(.kissGreen)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: 20, y: 0)
                ,alignment: .trailing
            )
            .padding(2)
            .frame(minWidth: maxProgressWidth)
            .fixedSize()
        }
        .offset(x: 18, y: -6)
        .fixedSize(horizontal: false, vertical: true)
        .padding(.trailing, 10)
    }
}

