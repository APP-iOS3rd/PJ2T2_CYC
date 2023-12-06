//
//  AboutCYC.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct AboutCYC: View {
    
    @State private var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bg.ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("CYC는 어떤 앱인가요?")
                                .font(.pretendardBold_20)
                                .padding(.vertical, 20)
                                
                            Text("CYC(Check Your Commit)은 주인장이 커밋을 자주 잊고 해서 다른 사람들도 이런 불편함이 있지 않을까? 해서 만들어진 앱이에요")
                                .font(.pretendardSemiBold_15)
                                .padding(.bottom, 15)
                            
                            Text("꾸준함을 어필하기 위해\n1일 1커밋을 같이 실천해 봐요!!")
                                .font(.pretendardSemiBold_15)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                        // MARK: - 만든 사람들
                        VStack(alignment: .leading, spacing: 0) {
                                Text("만든 사람들")
                                .font(.pretendardBold_20)
                                .padding(.horizontal, 20)
                            
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(0..<PersonData.count, id: \.self) { person in
                                    PersonGridView(person: PersonData[person])
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AboutCYC()
}
