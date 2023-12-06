//
//  AboutCYC.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct AboutCYC: View {
    
    @State private var columns = Array(repeating: GridItem(.flexible(), spacing: -15), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: - 만든 사람들
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

#Preview {
    AboutCYC()
}
