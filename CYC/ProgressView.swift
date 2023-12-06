//
//  ProgressView.swift
//  CYC
//
//  Created by 이민영 on 2023/12/06.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var containerWidth: CGFloat = 0
    @State private var progressTitle: String = ""
    
    @State private var showSheet = false
    @State private var number: Int = 1
    @State private var dday: Int = 0

    
    
    private let goal = 100
    @State private var step = 30
    
    
//    var maxWidth: Double {
//        return min((containerWidth / CGFloat(goal) * CGFloat(step)), containerWidth)
//    }
    // progress까지 가는
    var maxProgressWidth: Double {
//        return min(Double(progress), containerWidth)
        return min((containerWidth / CGFloat(goal) * CGFloat(step)), containerWidth)
    }
    
    var body: some View {
        VStack{
            Text(progressTitle)
            
            HStack{
                ZStack(alignment: .leading) {
                    
                    //progress bar 전체 범위
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundColor(.bgColor)
                            .onAppear {
                                containerWidth = geo.size.width
                            }
                    }
                    
                    
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color.white)
                        .frame(height: 4)
                    
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.progressBar)
                            .frame(height: 4)
                        
                        // progress bar 움직이는 이미지
                        Image(.kissGreen)
                            .resizable()
                            .scaledToFit()
                            .offset(x: 10, y: 0)
                            .frame(width: 40)
                    }
                    .padding(2)
                    //.frame(minWidth: maxWidth)
                    .frame(minWidth: maxProgressWidth)
                    .fixedSize()
                    
                    
                }
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(20)
                .onAppear {
                    progressTitle = "\(step) / \(goal)"
                    move()
                }
                
                // pink 공룡 - Dday button
                
                ZStack(alignment: .top){
                    // Dday 입력창 나오기
                    
                    Button {
                        showSheet.toggle()
                    } label: {
                        VStack{
                            Image(.kissPink2)
                                .resizable()
                                .scaledToFit()
                                .offset(x: -25, y: 8)
                                .frame(width: 40)
                            
                            Text("D-\(dday)")
                                .font(.pretendardSemiBold_12)
                                .foregroundStyle(.black)
                                .offset(x: -25, y: 10)
                            
                        }
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSheet) {
                        VStack{
                            Picker("Your age", selection: $dday) {
                                ForEach(1...100, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }.pickerStyle(.wheel)
                            Button("complete"){
                                
                                showSheet = false
                            }
                            
                        }
                        .presentationDetents([ .medium, .large])
                        .presentationBackground(.thinMaterial)
                        
                        
                    }
                    
                }
                
            }
            
            
        }/**VStack**/
        .background(Color.bgColor)
        
    }
    
    func move(){
        guard step < goal else { return }
        Task{
            for i in 0...step{
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                progressTitle = "\(i)"
                print(i/goal, i, goal, Double(i) / Double(goal))
                withAnimation {
                    step = Int((Double(i) / Double(goal) * 100.0))
                }
                
            }
        }
        
    }
    
    
    
}

struct buttonView: View{
    var body: some View{
        VStack{
            Image(.kissPink2)
                .resizable()
                .scaledToFit()
                .offset(x: -25, y: 8)
                .frame(width: 40)
            
            Text("D-0")
                .font(.pretendardSemiBold_12)
                .foregroundStyle(.black)
                .offset(x: -25, y: 10)
            
        }
    }
}




#Preview {
    ProgressView()
}


