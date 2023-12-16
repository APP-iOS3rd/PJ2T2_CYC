//
//  ColorModalView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/16.
//

import SwiftUI

struct ColorModalView: View {
    @Binding var cellColor: Color
    @Binding var showColorModal: Bool
    @State var selectedColorName = "green"
    
    var colorsName = ["red", "green", "blue", "cyan", "orange", "indigo"]
      
    var body: some View {
        VStack {
            Picker("Choose a color", selection: $selectedColorName) {
                ForEach(colorsName, id: \.self) {
                    Text($0)
                        .foregroundStyle(GrassColor[$0])
                }
            }
            .pickerStyle(.wheel)
            .cornerRadius(15)
            
            Button(action: {
                showColorModal.toggle()
                cellColor = GrassColor[selectedColorName]
            }) {
                Text("저장")
                    .font(.pretendardBold_17)
                    .foregroundStyle(Color.baseColor)
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
        
    }
}
