////
////  ProgressView.swift
////  CYC
////
////  Created by 이민영 on 2023/12/06.
////
//
import SwiftUI

struct ProgressView: View {
    @ObservedObject private var loginModel = LoginModel.shared
    @State private var containerWidth: CGFloat = 0
    @State private var showSheet: Bool = false
    
    // MARK: 커밋 변수
    @State private var progress: Int = 0
    @State private var goal: Int = 100
    @State private var step: Int = 50

    // MARK: 현재 step까지 가는 progress width 조절
    var maxProgressWidth: Double {
        let progressWidth = CGFloat(Double(progress) / Double(goal)) * containerWidth
        return min(progressWidth, containerWidth)
    }
    
    var body: some View {
        VStack{
            ProgressTextView()
            HStack{
                ProgressBarView(containerWidth: $containerWidth, maxProgressWidth: maxProgressWidth)
                    .onAppear {
                        progress = loginModel.tempday
                        ModalView(progress: $progress, goal: $goal, showSheet: $showSheet).moveDinosaur()
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
                        ModalView(progress: $progress, goal: $goal, showSheet: $showSheet)
                    }
                }
            }
        }
        .padding(.top, 20)
        .background(Color.bgColor)
    }
}

#Preview {
    ProgressView()
}


