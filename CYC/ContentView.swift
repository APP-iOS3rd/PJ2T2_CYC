//
//  StartView.swift
//  CYC
//
//  Created by 황성진 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") var isloggedInVIew: Bool = false
    
    var body: some View {
        ZStack {
            if isloggedInVIew {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
