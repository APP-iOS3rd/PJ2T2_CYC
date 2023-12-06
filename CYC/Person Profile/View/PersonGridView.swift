//
//  PersonGridView.swift
//  CYC
//
//  Created by 강치우 on 12/6/23.
//

import SwiftUI

struct PersonGridView: View {
    
    var person: Person
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 150,height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .foregroundStyle(person.color)
                    .shadow(color: .gray, radius: 2)
                
                VStack {
                    Text(person.name)
                        .font(.pretendardBold_20)
                    Text(person.subtitle)
                        .font(.pretendardSemiBold_12)
                    
                    Image(person.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    PersonGridView(person: Person(name: "Ciu", subtitle: "iOS Developer", image: "angry", color: .blue))
}
