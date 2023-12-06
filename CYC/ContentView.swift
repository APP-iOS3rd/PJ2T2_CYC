//
//  ContentView.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                
            Text("안녕하세여")
                .font(.pretendardBold)
            
            Text("안녕하세여")
        }
        .background(Color.bgColor)
        .padding()
    }
}

#Preview {
    ContentView()
}
