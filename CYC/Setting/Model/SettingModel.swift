//
//  SettingModel.swift
//  CYC
//
//  Created by 김명현 on 12/6/23.
//

import SwiftUI

struct SettingModel:Identifiable, Hashable {
   
    let id = UUID()
    let name: String
    let imageName: String
    let destination: () -> AnyView
    
    // MARK: - Equatable 프로토콜
    static func == (lhs: SettingModel, rhs: SettingModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: - Hashable 프로토콜
    func hash(into hasher: inout Hasher) { 
           hasher.combine(id)
       }
    
}
