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
    
    var sortedTodoModel: [TodoModel] { // 작성 시간 순서대로 정렬
        return todoModel.sorted(by: { $0.createdAt < $1.createdAt })
    }
    
    var backButton : some View {
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.base)
                    .bold()
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.bgColor.ignoresSafeArea(.all)
            VStack {
                // MARK: - 헤더
                HStack {
                    Text("오늘 뭐해?")
                        .font(.pretendardBold_25)
                    Spacer()
                    
                }
                .padding()
                
                // MARK: - 리스트
                List {
                    ForEach(sortedTodoModel) { list in
                        Text("\(list.title)")
                            .listRowBackground(Color.containerColor)
                        
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
        .scrollContentBackground(.hidden)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    
    
    // MARK: - CRUD 함수
    
    private func addTodo() {
        withAnimation {
            let newTodo = TodoModel(title: textFieldText)
            if !newTodo.title.isEmpty {
                modelContext.insert(newTodo)
                textFieldText = ""
            }
        }
        print(modelContext)
    }
    
    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            // Sort the indices in ascending order
            let sortedIndices = offsets.sorted()
            for index in sortedIndices {
                modelContext.delete(sortedTodoModel[index])
            }
        }
    }
}


#Preview {
    TodoView().preferredColorScheme(.dark)
}
