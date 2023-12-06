//
//  SettingModel.swift
//  CYC
//
//  Created by 김명현 on 12/6/23.
//

import Foundation
import SwiftUI

struct SettingModel:Identifiable, Hashable {
   
    let id = UUID()
    let name: String
    let imageName: String
    let destination: () -> AnyView
    
    static func == (lhs: SettingModel, rhs: SettingModel) -> Bool { // Equatable 프로토콜 
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) { // Hashable 프로토콜
           hasher.combine(id)
       }
    
}
