//
//  GrassColor.swift
//  CYC
//
//  Created by 이민영 on 2023/12/16.
//

import Foundation
import SwiftUI

struct GrassColor {
    static subscript(name: String) -> Color {
        switch name {
            case "red":
                return Color.red
            case "green":
                return Color.green
            case "blue":
                return Color.blue
            case "cyan":
                return Color.cyan
            case "orange":
                return Color.orange
            case "indigo":
                return Color.indigo
            default:
                return Color.accentColor
        }
    }
}
