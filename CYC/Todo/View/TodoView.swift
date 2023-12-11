//
//  TodoView.swift
//  CYC
//
//  Created by 김명현 on 12/7/23.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query private var todoModel: [TodoModel]
    
    @State var textFieldText = ""
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: - 헤더
                HStack {
                    Text("오늘 뭐해?")
                        .font(.pretendardBold_25)
                    Spacer()
                    EditButton()
                }
                .padding()
                
                // MARK: - 리스트
                List {
                    ForEach(todoModel) { list in
                        Text("\(list.title)")
                    }
                    .onDelete(perform: deleteTodos)
                }
                
                // MARK: - 텍스트필드, 할 일 추가버튼
                HStack {
                    TextField("일정을 입력해주세요", text: $textFieldText)
                        .textFieldStyle(.roundedBorder)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.baseColor, lineWidth: 1) // 테두리 색과 두께 설정
                        )
                        .padding(.leading)
                    
                    Button(action: { addTodo() }, label: {
                        Text("추 가")
                            .foregroundColor(Color.baseColor)
                            .bold()
                            .padding()
                    })
                }
            }
        }
    }
    
     
    
    // MARK: - CRUD 함수
    
    private func addTodo() {
        withAnimation {
            let newTodo = TodoModel(title: textFieldText)
            modelContext.insert(newTodo)
            textFieldText = ""
        }
    }
    
    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoModel[index])
            }
        }
    }
}


#Preview {
    TodoView().preferredColorScheme(.dark)
}
