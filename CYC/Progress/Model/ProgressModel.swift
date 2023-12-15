//
//  ProgressModel.swift
//  CYC
//
//  Created by 이민영 on 2023/12/15.
//

import Foundation

class ProgressModel: ObservableObject{
    static let shared = ProgressModel()
    
    @Published var containerWidth: CGFloat = 0
    @Published var showSheet: Bool = false
    
    // MARK: 커밋 변수
    @Published var progress: Int = 0
    @Published var goal: Int = 100
}
