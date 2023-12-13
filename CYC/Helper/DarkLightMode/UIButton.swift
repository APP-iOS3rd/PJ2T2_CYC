//
//  UIButton.swift
//  CYC
//
//  Created by 강치우 on 12/13/23.
//

import SwiftUI

enum AppearanceMode {
    case Dark, Light, System
}


struct UIButton: View {
    var mode: AppearanceMode
    @Binding var currentMode: AppearanceMode
    
    var Rbg: Color
    var Rbgi: Color
    var ibg: Color
    
    var body: some View {
        VStack(spacing: 20 ) {
            VStack {
                Circle()
                    .frame(width: 20, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 49, height: 6)
                VStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 38, height: 6)
                }
                .frame(width: 55, height: 50)
                .background(ibg, in: RoundedRectangle(cornerRadius: 5))
            }
            .foregroundStyle(Rbgi)
            .padding(8)
            .overlay {
                if currentMode == mode {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .padding(-3)
                }
            }
            
            .background(Rbg, in: RoundedRectangle(cornerRadius: 7))
            
            Text(String(describing: mode).capitalized)
                .foregroundStyle(.primary)
                .font(.pretendardSemiBold_17)
                .frame(width: 88, height: 25)
                .background(.bg, in: RoundedRectangle(cornerRadius: 10))
            
        }
        .scaleEffect(currentMode == mode ? 1.1 : 0.9)
        .animation(.default, value: currentMode)
    }
}
