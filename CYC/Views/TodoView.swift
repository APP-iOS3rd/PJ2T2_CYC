//
//  TodoView.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import SwiftUI

struct TodoView: View {
    
    var todoList = TodoViewModel().todoList
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("오늘 뭐해?")
                        .font(.pretendardBold_25)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color.baseColor)
                            .frame(width: 25,height: 25)
                    }
                }
                .padding()
                
                List {
                    ForEach(todoList) { list in
                        Text("\(list.title)")
                    }
                }
            }
        }
        
    }
}

#Preview {
    TodoView().preferredColorScheme(.dark)
}
