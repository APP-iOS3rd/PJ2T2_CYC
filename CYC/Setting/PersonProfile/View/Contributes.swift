//
//  Contributes.swift
//  CYC
//
//  Created by 강치우 on 12/16/23.
//

import SwiftUI

struct Contributes: View {
    
    @State private var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @Environment(\.dismiss) var dismiss
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.base)
                    .bold()
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea(.all)
            ScrollView {
                // MARK: - Intro
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Image("logo1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                        
                        Text("도움을 주신 분들")
                            .font(.pretendardBold_23)
                            .padding(.vertical, 10)
                        
                        Text("저희와 같은 팀은 아니였지만 앱 제작에 아무런 대가 없이 도움을 주신 분들을 위해 감사한 마음으로 만들어 봤어요")
                            .font(.pretendardSemiBold_15)
                            .lineSpacing(3)
                            .padding(.bottom, 15)
                        
                        Text("언제 어디서든 항상 행복하고 성공하길 바라며 CYC 제작에 도움을 주셔서 감사합니다")
                            .font(.pretendardSemiBold_15)
                            .lineSpacing(3)
                    }
                    .padding(.horizontal, 20)
                    // MARK: - Contribute
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(0..<ContributeData.count, id: \.self) { person in
                            PersonGridView(person: ContributeData[person])
                        }
                    }
                    .padding()
                    .padding(.vertical)
                }
                .padding(.top, 5)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("도움을 주신 분들")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

#Preview {
    Contributes()
}
