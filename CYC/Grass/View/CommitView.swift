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
    
    var body: some View {
        VStack {
            GrassView(loginModel.testCase, row: 4, col: 10, cellColor: .green)
        }
        .padding()
    }
}

#Preview {
    CommitView()
}
