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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Query private var todoModel: [TodoModel]
    
    @State var textFieldText = ""
    @State var isTextFieldShown = false
    
    var sortedTodoModel: [TodoModel] {
        return todoModel.sorted(by: { $0.createdAt < $1.createdAt })
    }
    
    var backButton : some View {  // <-- 👀 커스텀 버튼
            Button{
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left") // 화살표 Image
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.base)
                        .bold()
                }
            }
        }

    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.bgColor.ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("오늘 뭐해?")
                        .font(.pretendardBold_25)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    List {
                        ForEach(sortedTodoModel) { todo in
                                HStack {
                                    Button {
                                        toggleCompleted(todo)
                                    } label: {
                                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                    }
                                    .foregroundStyle(todo.completed ? Color.green : Color.base)
                                    
                                    Text(todo.title)
                                        .foregroundStyle(todo.completed ? Color.gray : Color.base)
                                        .font(.pretendardSemiBold_15)
                                }
                                .listRowBackground(Color.bgColor)
                        }
                        .onDelete(perform: deleteTodos)
                        
                        if isTextFieldShown {
                            TextField("일정을 입력해주세요", text: $textFieldText, onCommit: {
                                if !textFieldText.isEmpty {
                                    addTodo()
                                }
                            })
                            .listRowBackground(Color.bgColor)
                            .background(Color.bgColor)
                            .padding(.leading, 20)
                            
                        }
                    }
                    .padding(.top, -20)
                    .padding(.horizontal, -20)
                    
                    // MARK: - "새로운 일정" 버튼
                    
                    Button {
                        isTextFieldShown.toggle()
                        textFieldText = ""
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("새로운 일정")
                        }
                        .padding(.leading, 30)
                        .padding(.bottom, 10)
                    }
                    .foregroundColor(Color.baseColor)
                }
            }
            .scrollContentBackground(.hidden)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
    
    // MARK: - CRUD 함수
    
    private func addTodo() {
        withAnimation {
            let newTodo = TodoModel(title: textFieldText)
            if !newTodo.title.isEmpty {
                modelContext.insert(newTodo)
                isTextFieldShown.toggle()
            }
        }
    }
    
    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoModel[index])
            }
        }
    }
    
    func toggleCompleted(_ todoItem: TodoModel) {
        todoItem.completed.toggle()
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    TodoView().preferredColorScheme(.dark)
}
