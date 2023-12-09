//
//  LicenseView.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import SwiftUI

struct LicenseView: View {
    
    let info = LicenseViewModel().licenseInfo
    
    var body: some View {
        
        VStack(alignment: .leading) {
           // MARK: - 해더
            Text("라이센스")
                .font(.pretendardBold_25)
                .padding(.bottom, 5)
            Text("터치 시 라이센스 링크로 연결합니다")
                .font(.pretendardLight_11)
                .padding(.bottom, 20)
            
            // MARK: - 스크롤뷰(라이센스 링크)
            ScrollView {
                ForEach(info) { info in
                    
                    Link("\(info.text)", destination: URL(string: "\(info.destination)")!)
                        .font(.pretendardSemiBold_15)
                        .padding(.bottom, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.bgColor)
    }
}

#Preview {
    LicenseView().preferredColorScheme(.dark)
}
