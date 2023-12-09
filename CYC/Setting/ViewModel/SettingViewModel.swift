//
//  SettingViewModel.swift
//  CYC
//
//  Created by 김명현 on 12/6/23.
//

import Foundation
import SwiftUI

struct SettingViewModel {
    
    let settings: [SettingModel] = [
        SettingModel(name: "알림설정", imageName: "worker", destination: { AnyView(NotificationView()) }),
        SettingModel(name: "CYC에 대해서", imageName: "idea", destination: { AnyView(AboutCYC()) }),
        SettingModel(name: "라이센스", imageName: "idea",destination: { AnyView(LicenseView()) }),
    ]
    
}
