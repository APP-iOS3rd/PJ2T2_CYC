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
                    .frame(height: 50)
                    
                    Divider()
                        .frame(width: 350)
                        .offset(x: 22)
                    // MARK: - Todo 미리보기 바디
                    if todoModel.count == 1 {
                        ForEach(todoModel.prefix(1)) { list in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .todoPreviewImageModifier()
                                Spacer()
                                Text("\(list.title)")
                                    .todoPreviewTextModifier()
                            }
                            .offset(y: 10)
                            .padding(.leading, 20)
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -15)
                        Spacer()
                            .frame(height: 95)
                    } else if todoModel.count == 2 {
                        ForEach(todoModel.prefix(2)) { list in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .todoPreviewImageModifier()
                                Spacer()
                                Text("\(list.title)")
                                    .todoPreviewTextModifier()
                            }
                            .offset(y: 10)
                            .padding(.leading, 20)
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -15)
                        Spacer()
                            .frame(height: 50)
                    } else {
                        ForEach(todoModel.prefix(3)) { list in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .todoPreviewImageModifier()
                                Spacer()
                                Text("\(list.title)")
                                    .todoPreviewTextModifier()
                            }
                            .offset(y: 10)
                            .padding(.leading, 20)
                        }
                        .scrollContentBackground(.hidden)
                        .frame(width: 350)
                        .offset(y: -15)
                    }
                }
            }
        }
    }
}

extension Image {
    func todoPreviewImageModifier() -> some View {
        self
            .resizable()
            .frame(width: 6, height: 6)
            .foregroundColor(Color.baseColor)
            .padding(.leading, 20)
        
    }
}

extension Text {
    func todoPreviewTextModifier() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .listRowBackground(Color.containerColor)
            .font(.pretendardSemiBold_15)
            .foregroundColor(Color.baseColor)
        
    }
}

#Preview {
    TodoPreView()
}
