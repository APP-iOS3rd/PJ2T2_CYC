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
    @ObservedObject private var progressModel = ProgressModel.shared

    // MARK: 현재 CommitDay까지 가는 progress width 조절
    var maxProgressWidth: Double {
        let progressWidth = CGFloat(Double(progressModel.progress) / Double(progressModel.goal)) * progressModel.containerWidth
        return min(progressWidth, progressModel.containerWidth)
    }
    
    var body: some View {
        VStack{
            ProgressTextView()
            HStack{
                ProgressBarView(maxProgressWidth: maxProgressWidth)
                    .onAppear {
                        progressModel.progress = loginModel.commitDay
                        ModalView().moveDinosaur()
                    }

                ZStack(alignment: .top) {
                    Button {
                        progressModel.showSheet.toggle()
                    } label: {
                        DdayButtonView(goal: $progressModel.goal)
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $progressModel.showSheet) {
                        ModalView()
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


