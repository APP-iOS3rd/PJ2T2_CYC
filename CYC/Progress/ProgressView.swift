////
////  ProgressView.swift
////  CYC
////
////  Created by 이민영 on 2023/12/06.
////
//
import SwiftUI

struct ProgressView: View{
    
    @State private var containerWidth: CGFloat = 0
    @State private var progressTitle: String = ""
    
    @State private var showSheet = false
    @State private var goal: Int = 100

    // MARK: 연속 커밋 일수 - step
    @State private var step = 50

    // MARK: 현재 step까지 가는 progress width 조절
    var maxProgressWidth: Double {
        let progressWidth = CGFloat(Double(step) / Double(goal)) * containerWidth
        return min(progressWidth, containerWidth)
    }
    
    var body: some View {
        VStack{
            /*디버깅 테스트용*/
//            Text(progressTitle)
            
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
                            .foregroundColor(.progressBar)
                            .frame(height: 4)
                    }
                    /* progress bar 움직이는 이미지 */
                    .overlay(
                            Image(.kissGreen)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(x: 30, y: 0)
                        , alignment: .trailing
                    )
                    .padding(2)
                    .frame(minWidth: maxProgressWidth)
                    .fixedSize()
                    
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(20)
                .onAppear {
                    progressTitle = "\(step) / \(goal)"
                    DdayButtonView(step: $step, goal: $goal, showSheet: $showSheet, progressTitle: $progressTitle).moveDinosaur()
                }
                
                // MARK: Dday 관련 버튼, 입력 모달 나오는 뷰
                ZStack(alignment: .top) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        VStack{
                            Image(.kissPink)
                                .resizable()
                                .scaledToFit()
                                .offset(x: -18, y: 6.5)
                                .frame(width: 40)
                            
                            Text("D-\(goal)")
                                .font(.pretendardSemiBold_12)
                                .foregroundStyle(Color.baseColor)
                                .offset(x: -18, y: 7)
                            
                        }
                    }
                    .tint(.clear)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSheet) {
                        DdayButtonView(step: $step, goal: $goal, showSheet: $showSheet, progressTitle: $progressTitle)
                    }
                }
            }

        }/**VStack**/
        .background(Color.bgColor)

    }/**body**/
    
    
    
}


struct DdayButtonView: View {
    @Binding var step: Int
    @Binding var goal: Int
    @Binding var showSheet: Bool
    @Binding var progressTitle: String
   
    var body: some View {
        VStack {
            Picker("Your D-day", selection: $goal) {
                ForEach(1...100, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.wheel)
            Button("Save") {
                showSheet = false
                moveDinosaur()
            }
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.thinMaterial)
    }
    
    func moveDinosaur() {
        print("save?")
        Task{
            for i in 0...step {
                try await Task.sleep(until: .now.advanced(by: .milliseconds(40)), clock: .continuous)
                progressTitle = "\(i)"
                withAnimation {
                    step = i
                }
                
            }
        }
    }
    
}




#Preview {
    ProgressView()
}


