//
//  ModalView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ModalView: View {
    @ObservedObject var loginModel = LoginModel.shared
    @ObservedObject var progressModel = ProgressModel.shared

    var body: some View {
        VStack {
            Picker("Your D-day", selection: $progressModel.goal) {
                ForEach(1...365, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            Button {
                progressModel.showSheet = false
                moveDinosaur()
                progressModel.updateGoal(newGoal: progressModel.goal)
            } label: {
                Text("저장")
                    .font(.pretendardBold_17)
                    .foregroundStyle(Color.baseColor)
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
    }
    
    // Animation에 대한 함수는 뷰에서만 정의 가능
    func moveDinosaur() {
        Task {
            for i in 0...loginModel.commitDay {
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                withAnimation {
                    progressModel.progress = i
                }
            }
        }
    }
    
}
