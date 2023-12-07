//
//  TodoVIewModel.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import Foundation

struct TodoViewModel {
    var todoList:[TodoModel] = [
        TodoModel(title: "알고리즘 풀기"),TodoModel(title: "Swift Data 공부"), TodoModel(title: "UIKit")
    ]
}
