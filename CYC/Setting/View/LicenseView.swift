//
//  LicenseView.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import SwiftUI

struct LicenseView: View {
    
    let info = LicenseViewModel().licenseInfo
    @Environment(\.dismiss) var dismiss
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.gray)
                    .bold()
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                // MARK: - 해더
                Text("라이센스")
                    .font(.pretendardBold_23)
                    .padding(.bottom, 5)
                Text("터치 시 라이센스 링크로 연결합니다")
                    .font(.pretendardLight_11)
                    .padding(.bottom, 20)
                
                // MARK: - 스크롤뷰(라이센스 링크)
                ForEach(info) { info in
                    
                    Link("\(info.text)", destination: URL(string: "\(info.destination)")!)
                        .font(.pretendardSemiBold_15)
                        .padding(.bottom, 15)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.baseColor)
                }
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .vSpacing(.topLeading)
            
        }
        .navigationTitle("라이센스")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    LicenseView().preferredColorScheme(.dark)
}
