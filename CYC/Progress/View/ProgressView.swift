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
    
    var body: some View {
        VStack {
            ProgressTextView()
            HStack(alignment: .center) {
                ProgressBarView()
                    .onAppear {
                        progressModel.progress = loginModel.commitDay
                        ModalView().moveDinosaur()
                    }
                
                // pink dinosaur button view
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
                .padding(.top, -15)
            }
            .padding(.horizontal, 5)
        }
        .padding(.top, 20)
        .background(Color.bgColor)
    }
}

#Preview {
    ProgressView()
}


