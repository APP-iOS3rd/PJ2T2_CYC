//
//  SettingViewModel.swift
//  CYC
//
//  Created by 김명현 on 12/6/23.
//

import SwiftUI

struct SettingViewModel {
    
    let settings: [SettingModel] = [
        SettingModel(name: "CYC에 대해서", imageName: "worker", destination: { AnyView(AboutCYC()) }),
        SettingModel(name: "알림설정", imageName: "idea", destination: { AnyView(NotificationView()) }),
        SettingModel(name: "라이센스", imageName: "idea",destination: { AnyView(LicenseView()) }),
    ]
    
}
