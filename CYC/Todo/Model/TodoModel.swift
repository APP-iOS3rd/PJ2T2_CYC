//
//  TodoModel.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import SwiftUI
import SwiftData

@Model
final class TodoModel: Identifiable {
    var id = UUID()
    var title: String


    init(title: String = "") {
        self.title = title
    }
    
}
