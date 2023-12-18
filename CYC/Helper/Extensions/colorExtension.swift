//
//  colorExtension.swift
//  CYC
//
//  Created by 황민채 on 12/6/23.
//

import SwiftUI

extension Color {
    static let bgColor = Color("bgColor")
    static let containerColor = Color("containerColor")
    static let logoutColor = Color("logoutColor")
    static let progressBarColor = Color("progressBarColor")
    static let baseColor = Color("baseColor")
}

extension Color: RawRepresentable {
    
    public init?(rawValue: String) {
        
        guard let data = Data(base64Encoded: rawValue) else{
            self = .green
            return
        }
        
        do{
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .green
            self = Color(color)
        }catch{
            self = .green
        }
        
    }
    
    public var rawValue: String {
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
            return data.base64EncodedString()
            
        }catch{
            
            return ""
            
        }
        
    }
    
}

