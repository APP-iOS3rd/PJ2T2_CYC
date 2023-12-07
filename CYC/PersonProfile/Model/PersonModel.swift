//
//  SwiftUIView.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var subtitle: String
    var image: String
    var color: Color
}

var PersonData: [Person] = [
    Person(name: "Ciu", subtitle: "iOS Developer", image: "angry", color: .ciu),
    Person(name: "MinChae", subtitle: "iOS Developer", image: "kiss_pink", color: .minchae),
    Person(name: "Minyoung", subtitle: "iOS Developer", image: "beauty", color: .minyoung),
    Person(name: "MyungHyun", subtitle: "iOS Developer", image: "dizzy", color: .myunhyun),
    Person(name: "SungJin", subtitle: "iOS Developer", image: "music", color: .orange)
]
