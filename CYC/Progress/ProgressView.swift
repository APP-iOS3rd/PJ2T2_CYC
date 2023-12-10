////
////  ProgressView.swift
////  CYC
////
////  Created by 이민영 on 2023/12/06.
////
//
import SwiftUI

struct ProgressView: View {
    @State private var containerWidth: CGFloat = 0
    @State private var showSheet: Bool = false
    
    // MARK: 커밋 변수
    @State private var step: Int = 100
    @State private var goal: Int = 100

    // MARK: 현재 step까지 가는 progress width 조절
    var maxProgressWidth: Double {
        let progressWidth = CGFloat(Double(step) / Double(goal)) * containerWidth
        return min(progressWidth, containerWidth)
    }
    
    var body: some View {
        VStack{
            HStack{
                ProgressBarView(containerWidth: $containerWidth, maxProgressWidth: maxProgressWidth)
                .onAppear {
                    ModalView(step: $step, goal: $goal, showSheet: $showSheet).moveDinosaur()
                }
                ZStack(alignment: .top) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        DdayButtonView(goal: $goal)
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSheet) {
                        ModalView(step: $step, goal: $goal, showSheet: $showSheet)
                    }
                }
            }
        }
        .background(Color.bgColor)
    }
}

#Preview {
    ProgressView()
}


