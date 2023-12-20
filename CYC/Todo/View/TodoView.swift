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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Query private var todoModel: [TodoModel]
    
    @State var textFieldText = ""
    @State var isTextFieldShown = false
    @FocusState var focused: Bool
    
    var modelContext: ModelContext
    var sortedTodoModel: [TodoModel] { // 생성시간 오래된 순으로 정렬
        return todoModel.sorted(by: { $0.createdAt < $1.createdAt })
    }

    var backButton : some View {  // 커스텀 버튼
        Button{
            dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.gray)
                    .bold()
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.bgColor // 배경색 변경
                    .ignoresSafeArea(.all)
                    // MARK: - 헤더
                    VStack(alignment: .leading) {
                        Text("할 일 목록")
                            .font(.pretendardBold_25)
                            .padding(.leading, 15)
                            .padding(.top, 10)
                        
                        // MARK: - 리스트
                        List {
                            ForEach(sortedTodoModel) { todo in
                                HStack {
                                    Button {
                                        toggleCompleted(todo)
                                    } label: {    // 완료여부에 따라 이미지 변경
                                        Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                    }
                                    .foregroundStyle(todo.completed ? Color.green : Color.base) // 완료여부에 따라 이미지 색 변경
                                    
                                    Text(todo.title)
                                        .foregroundStyle(todo.completed ? Color.gray : Color.base) // 완료여부에 따라 폰트 색 변경
                                        .font(.pretendardSemiBold_15)
                                }
                                .listRowBackground(Color.bgColor)
                            }
                            .onDelete(perform: deleteTodos)
                            
                            if isTextFieldShown {   // textField 생성 조건문
                                HStack{
                                    Image(systemName: "circle")
                                    
                                    TextField("일정을 입력해주세요", text: $textFieldText, onCommit: {
                                        if !textFieldText.isEmpty {
                                            addTodo()
                                        }
                                    })
                                    .font(.pretendardSemiBold_15)
                                    .focused($focused)
                                }
                                .scrollContentBackground(.hidden)
                                .listRowBackground(Color.bgColor)
                                .background(Color.bgColor)
                                .onAppear {  // 텍스트 필드 생성시 키보드 자동 등장
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        self.focused = true
                                    }
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .padding(.top, -20)
                        .padding(.leading, -15)
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
                            .padding([.leading, .bottom], 20)
                        }
                        .foregroundColor(Color.baseColor)
                    }
                    .scrollContentBackground(.hidden)
            }
            .navigationTitle("오늘 뭐해?")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
    
    
    // MARK: - CRUD 함수
    
    func addTodo() {
        withAnimation {
            let newTodo = TodoModel(title: textFieldText)
            if !newTodo.title.isEmpty {
                modelContext.insert(newTodo)
                isTextFieldShown.toggle()
            }
        }
    }
    
    func deleteTodos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(sortedTodoModel[index])
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


struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        let modelContext = TodoPreView().modelContext
        return TodoView(modelContext: modelContext).preferredColorScheme(.dark)
    }
}
