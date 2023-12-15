//
//  AboutCYC.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct AboutCYC: View {
    
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
        NavigationStack {
            // NavigationTitle 넣어야함
            ZStack {
                Color.bg.ignoresSafeArea(.all)
                ScrollView {
                    // MARK: - Intro
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("CYC는 어떤 앱인가요?")
                                .font(.pretendardBold_25)
                                .padding(.vertical, 15)
                                
                            Text("CYC(Check Your Commit)은 주인장이 커밋을 자주 잊곤 해서 다른 사람들도 이런 불편함이 있지 않을까? 해서 만들어진 앱이에요")
                                .font(.pretendardSemiBold_15)
                                .padding(.bottom, 15)
                            
                            Text("커밋 할 때 까지 여러분들을 귀찮게 할 수도 있어요\n하지만 꾸준함을 보여주기 위해 같이 1일 1커밋 같이 해봐요")
                                .font(.pretendardSemiBold_15)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                        
                        // MARK: - With
                        VStack(alignment: .leading, spacing: 0) {
                                Text("함께하신 분들")
                                .font(.pretendardBold_25)
                                .padding(.horizontal, 20)
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(0..<PersonData.count, id: \.self) { person in
                                    PersonGridView(person: PersonData[person])
                                }
                            }
                            .padding()
                        }
                        
                        // MARK: - Contribute
                        VStack(alignment: .leading, spacing: 0) {
                                Text("도움을 주신 분들")
                                .font(.pretendardBold_25)
                                .padding(.horizontal, 20)
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(0..<ContributeData.count, id: \.self) { person in
                                    PersonGridView(person: ContributeData[person])
                                }
                            }
                            .padding()
                        }
                        .padding(.vertical)
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .DismissGesture()
    }
}

#Preview {
    AboutCYC()
}
