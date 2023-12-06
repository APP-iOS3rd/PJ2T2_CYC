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
    @State private var goal: Int = 100
    @State private var progress: Int = 0
    
    // MARK: 연속 커밋 일수 - step
    @State private var step = 0

    // progress까지 가는
    var maxProgressWidth: Double {
//        print(min((containerWidth / CGFloat(100) * CGFloat(progress)), containerWidth))
        return min((containerWidth / CGFloat(100) * CGFloat(progress)), containerWidth)
    }
    
    var body: some View {
        VStack{
            // 디버깅 테스트용
            Text(progressTitle)
            
            HStack{
                ZStack(alignment: .leading) {
                    
                    //progress bar 전체 범위 뷰
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
                            .offset(x: 30, y: 0)
                            .frame(width: 40)
                    }
                    .padding(2)
                    .frame(minWidth: maxProgressWidth)
                    .fixedSize()
                    
                    
                }
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(20)
                .onAppear {
                    progressTitle = "\(step) / \(goal)"
                    moveDinosaur()
                }
                
                // MARK: Dday 관련 버튼, 입력 모달 나오는 뷰
                ZStack(alignment: .top){
                    Button {
                        showSheet.toggle()
                    } label: {
                        VStack{
                            Image(.kissPink2)
                                .resizable()
                                .scaledToFit()
                                .offset(x: -18, y: 6.5)
                                .frame(width: 40)
                            
                            Text("D-\(goal)")
                                .font(.pretendardSemiBold_12)
                                .foregroundStyle(.black)
                                .offset(x: -18, y: 7)
                            
                        }
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSheet) {
                        VStack{
                            Picker("Your D-day", selection: $goal) {
                                ForEach(1...100, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }.pickerStyle(.wheel)
                            Button("Save"){
                                showSheet = false
                                moveDinosaur()
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
    
    func moveDinosaur(){
        Task{
            for i in 0...step{
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                progressTitle = "\(i)"
                withAnimation {
                    progress = Int((Double(i) / Double(goal) * 100.0))
                    print("%: ", progress)
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


