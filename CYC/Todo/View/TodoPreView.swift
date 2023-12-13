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
                    .cornerRadius(15.0)
                VStack(alignment: .leading) {
                    // MARK: - Todo 미리보기 헤더
                    HStack {
                        Text("오늘 뭐해?")
                            .font(.pretendardSemiBold_17)
                            .foregroundColor(Color.baseColor)
                            .padding(.leading, 10)
                    }
                    .padding(.leading, 10)
                    .frame(height: 50)
                    .offset(y: 5)
                    
                
                    // MARK: - Todo 미리보기 바디
                    
                    Spacer()
                        .frame(height: todoModel.count == 0 ? 140 : 0)

                        ForEach(todoModel.prefix(3)) { list in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 6, height: 6)
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
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -10)
                        Spacer()
                            .frame(height: todoModel.count == 1 ? 110 : (todoModel.count == 2 ? 60 : 10))
                }
            }
        }
    }
}


#Preview {
    TodoPreView()
}
