//
//  DdayButtonView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/10.
//

import SwiftUI

struct DdayButtonView: View {
    @Binding var goal: Int
    
    var body: some View {
        VStack{
            Image(.kissPink)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            
            Text("D-\(goal)")
                .font(.pretendardSemiBold_12)
                .foregroundStyle(Color.baseColor)
        }
    }
}

