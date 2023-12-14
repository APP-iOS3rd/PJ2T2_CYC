//
//  DdayButtonView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct ModalView: View {
    @Binding var progress: Int
    @Binding var goal: Int
    @Binding var showSheet: Bool
   
    var body: some View {
        VStack{
            Picker("Your D-day", selection: $goal) {
                ForEach(1...100, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            Button {
                showSheet = false
                moveDinosaur()
            } label: {
                Text("저장")
                    .font(.pretendardBold_17)
                    .foregroundStyle(Color.baseColor)
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
    }
    
    func moveDinosaur() {
        Task{
            for i in 0...progress {
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                withAnimation {
                    progress = i
                }
            }
        }
    }
    
}
