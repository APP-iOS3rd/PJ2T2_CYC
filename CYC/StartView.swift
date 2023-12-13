//
//  StartView.swift
//  CYC
//
//  Created by 황성진 on 12/11/23.
//

import SwiftUI

struct StartView: View {
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
    StartView()
}
