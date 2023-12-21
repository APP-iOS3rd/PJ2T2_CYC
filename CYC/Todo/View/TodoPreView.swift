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
    @Environment(\.modelContext) var modelContext: ModelContext
    
    var sortedTodoModel: [TodoModel] { // 생성시간 오래된 순으로 정렬
        return todoModel.sorted(by: { $0.createdAt < $1.createdAt })
    }
    
    var body: some View {
        NavigationLink(destination: TodoView(modelContext: modelContext)) {
            
            ZStack/*(alignment: .leading)*/ {
                Rectangle()
                    .fill(Color.containerColor)
                    .cornerRadius(15.0)
                    .padding(.horizontal, 25)
                
                VStack {
                    // MARK: - Todo 미리보기 헤더
                    GeometryReader { geometry in
                        HStack {
                            Text("오늘 뭐해?")
                                .font(.pretendardBold_17)
                                .foregroundStyle(.base)
                                .padding(.leading, geometry.size.width / 10)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.base)
                                .padding(.trailing, geometry.size.width / 10)
                        }
                        .padding(.top, 15)
                    }
                    
                    Divider()
                        .padding(.horizontal, 25)
                        .padding(.top, 30)
                    Spacer()
                        .frame(height: todoModel.count == 0 ? 140 : 0)
                    // MARK: - Todo 미리보기 바디
                    ForEach(sortedTodoModel.prefix(3)) { list in
                        HStack {
                            Button {
                                TodoView(modelContext: modelContext).toggleCompleted(list)
                            } label: {    // 완료여부에 따라 이미지 변경
                                Image(systemName: list.completed ? "checkmark.circle.fill" : "circle")
                            }
                            .buttonStyle(PlainButtonStyle())
                            .foregroundStyle(list.completed ? Color.green : Color.base)
                            Spacer()
                            Text("\(list.title)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(10)
                                .font(.pretendardSemiBold_15)
                                .foregroundStyle(list.completed ? Color.gray : Color.base)
                        }
                        .padding(.leading, 40)
                        
                    }
                    .scrollContentBackground(.hidden)
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
