//
//  CommitModel.swift
//  CYC
//
//  Created by 이민영 on 2023/12/19.
//

import Foundation
import SwiftUI

class CommitModel: ObservableObject{
    static let shared = CommitModel()
    
    
    @Published var showColorModal = false
    
    @Published var selectedColorName: String = "red"

}
