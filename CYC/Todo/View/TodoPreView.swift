//
//  TodoPreView.swift
//  CYC
//
//  Created by 김명현 on 12/11/23.
//


import SwiftUI
import SwiftData

struct TodoPreView: View {
    
    @Query private var todoModel: [TodoModel]
    
    var body: some View {
        
        NavigationLink(destination: TodoView()) {
            ZStack {
                Rectangle()
                    .fill(Color.containerColor)
                    .frame(width: 350, height: 200)
                    .cornerRadius(8.0)
                VStack(alignment: .leading) {
                    // MARK: - Todo 미리보기 헤더
                    HStack {
                        Image("drawing")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("오늘 뭐해?")
                            .font(.pretendardSemiBold_17)
                            .foregroundColor(Color.baseColor)
                    }
                    .position(x: 80, y: 30)
                    .padding(.leading, 10)
                    
                    
                    Divider()
                        .frame(width: 350)
                        .offset(x: 20)
                    
                    // MARK: - Todo 미리보기 바디
                    VStack(spacing: 10) {
                        ForEach(todoModel.prefix(3)) { list in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color.baseColor)
                                    .padding(.leading, 20)
                                Spacer()
                                Text("\(list.title)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                    .listRowBackground(Color.containerColor)
                                    .font(.pretendardSemiBold_15)
                                    .foregroundColor(Color.baseColor)
                            }
                            .offset(y: 10)
                            .padding(.leading, 15)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .frame(width: 350)
                    .offset(y: -15) 
                }
            }
        }
        
    }
}


#Preview {
    TodoPreView()
}
