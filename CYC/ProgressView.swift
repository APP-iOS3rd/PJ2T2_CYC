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
    @State private var progress: Int = 0

    var maxWidth: Double {
        return min((containerWidth / CGFloat(goal) * CGFloat(step)), containerWidth)
       
    }
   
    private let goal = 100
    @State private var step = 10
    
    var body: some View {
        VStack{
            Text(progressTitle)
            
            
            Button(action: {
                print("slsl")
            })
            {
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
                        .frame(minWidth: maxWidth)
                        .fixedSize()
                        
                        
                    }
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(20)
                    .onAppear {
                        progressTitle = "\(step) / \(goal)"
                    }
                    
                    Image(.kissPink)
                        .resizable()
                        .scaledToFit()
                        .offset(x: -25, y: -3)
                        .frame(width: 40)
                    
                    
                    
                }
            }

            
            Button("Start") {
                guard step < goal else { return }
                
                withAnimation(.linear(duration: 0.5)){
                    step += 1
                }

                progressTitle = "\(step) / \(goal)"
            }

            
        }/**VStack**/
        .background(Color.bgColor)
        
    }
}

#Preview {
    ProgressView()
}
