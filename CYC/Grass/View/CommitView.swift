//
//  GrassView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/12.
//

import SwiftUI
import GrassView

struct CommitView: View {
    @ObservedObject private var loginModel = LoginModel.shared
    @State private var showColorModal = false
    @State private var cellColor: Color = .green
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.containerColor)
                .frame(width: 350, height: 200)
                .cornerRadius(15.0)
            
            VStack(alignment: .leading) {
                Text("커밋 기록")
                    .font(.pretendardBold_17)
                    .foregroundStyle(.base)
                    .padding(.bottom, 10)
                ZStack {
                    GrassView(loginModel.testCase, row: 4, col: 10, cellColor: cellColor)
                    RoundedRectangle(cornerRadius: 15.0)
                        .frame(width: 320, height: 120)
                        .foregroundStyle(Color(white: 1.0, opacity: 0.001))
                    
                }
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            showColorModal.toggle()
                        })
                .sheet(isPresented: $showColorModal) {
                    ColorModalView(cellColor: $cellColor, showColorModal: $showColorModal)
                }
            }
            .padding(40)
        }
    }
}

#Preview {
    CommitView()
}
