//
//  DLMode.swift
//  Components
//
//  Created by 강치우 on 12/12/23.
//

import SwiftUI

struct DLMode: View {
    
    @Binding var appearanceMode: AppearanceMode
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 270)
                        .foregroundStyle(.background)
                    VStack(spacing: 20) {
                        HStack {
                            Text("테마 설정")
                                .font(.pretendardBold_25)
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle.fill")
                        }
                        .bold()
                        .font(.title)
                        .foregroundStyle(.primary)
                        .padding(.vertical)
                        .padding(.horizontal, 23)
                        
                        HStack(spacing: 40) {
                            
                            // Light Mode
                            Button {
                                appearanceMode = .Light
                            } label: {
                                UIButton(mode: .Light, currentMode: $appearanceMode, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .white)
                            }
                            .tint(.primary)
                            
                            // Dark Mode
                            Button {
                                appearanceMode = .Dark
                            } label: {
                                UIButton(mode: .Dark, currentMode: $appearanceMode, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .black)
                            }
                            .tint(.primary)
                            
                            // System Mode
                            ZStack {
                                UIButton(mode: .System, currentMode: $appearanceMode, Rbg: Color(.systemGray), Rbgi: Color(.systemGray4), ibg: .white)
                                UIButton(mode: .System, currentMode: $appearanceMode, Rbg: Color(.systemGray), Rbgi: Color(.systemGray3), ibg: .black)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 50, height: 200)
                                            .offset(x: -24)
                                    }
                            }
                            .onTapGesture {
                                appearanceMode = .System
                            }
                        }
                    }
                }
                .padding(.horizontal, 8)
                .preferredColorScheme(AppearanceMode(rawValue: appearanceMode.rawValue)?.colorScheme)
                
            }
            .offset(y: show ? 300 : -30)
        }
        .onTapGesture {
            show.toggle()
        }
    }
}

#Preview {
    DLMode(appearanceMode: .constant(.Dark), show: .constant(false))
}


