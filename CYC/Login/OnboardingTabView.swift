//
//  OnboardingScroll.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct OnboardingTabView: View {
    
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
            VStack {
                Image("music")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 177, height: 161)
                Image("grass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 153, height: 82)
            }
            .tag(0)
            Text("Second Image")
                .tag(1)
            Text("Third Image")
                .tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    OnboardingTabView()
}
