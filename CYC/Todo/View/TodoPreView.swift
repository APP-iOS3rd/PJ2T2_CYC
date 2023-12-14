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
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.containerColor)
                    .frame(width: 350, height: 200)
                    .cornerRadius(15.0)
                VStack(alignment: .leading) {
                    // MARK: - Todo 미리보기 헤더
                    HStack(spacing: 230) {
                        Text("오늘 뭐해?")
                        .font(.pretendardBold_17)
                        .foregroundStyle(.base)

                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(.base)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)

                    Divider()
                        .frame(width: 350)
                        .padding(.top, 5)
                
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
                            .offset(y: 25)
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -20)
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
